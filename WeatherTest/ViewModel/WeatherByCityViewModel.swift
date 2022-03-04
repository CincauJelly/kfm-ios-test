//
//  WeatherByCityViewModel.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import SwiftUI
import CoreLocation

class WeatherByCityViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var description: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
    @Published var lat: Float = -6.2146
    @Published var lon: Float = 106.8451
    
    init() {
        fetchWeather()
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
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
                    print("data gets")
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
                print("data gets")
            } catch {
                print("Failed to decode \(error)")
            }
        }
            task.resume()
    }
    
}
