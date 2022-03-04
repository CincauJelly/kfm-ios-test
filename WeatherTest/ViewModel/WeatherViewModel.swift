//
//  WeatherViewModel.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 03/03/22.
//

import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var description: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
    @Published var lat: Float = 51.5085
    @Published var lon: Float = -0.1257
    
    init() {
        fetchWeather()
    }
    
    func getWeather(latitude:Float,longitude:Float){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&lang=id&units=metric&exclude=hourly,daily,minutely&appid=fcd7991b587c84ace98da243899b7736") else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) {data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.title = model.current.weather.first?.main ?? "No Title"
                        self.description = model.current.weather.first?.description ?? "No description"
                        self.temp = "\(model.current.temp)°"
                        self.timezone = model.timezone
                        
                    }
                    print("data get")
                } catch {
                    print("Failed to decode \(error)")
                }
            }
                task.resume()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&lang=id&units=metric&exclude=hourly,daily,minutely&appid=fcd7991b587c84ace98da243899b7736") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.description = model.current.weather.first?.description ?? "No description"
                    self.temp = "\(model.current.temp)°"
                    self.timezone = model.timezone
                    
                }
                print("data get")
            } catch {
                print("Failed to decode \(error)")
            }
        }
            task.resume()
    }
    
}
