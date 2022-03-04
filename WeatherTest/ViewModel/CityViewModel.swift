//
//  CityViewModel.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import Foundation

class CityViewModel: ObservableObject{
    @Published var name: String = "-"
    @Published var lat: Float = 0.0
    @Published var lon: Float = 0.0
    @Published var country: String = "-"
    @Published var state: String = "-"
    
    func getCoordinates(city:String){
        guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=5&appid=fcd7991b587c84ace98da243899b7736") else {
                return
            }
            let task = URLSession.shared.dataTask(with: url) {data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(CityModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.name = model.name
                        self.lat = model.lat
                        self.lon = model.lon
                        self.country = model.country
                        self.state = model.state
                    }
                    print("datas get")
                } catch {
                    print("Failed to decode \(error)")
                }
            }
            task.resume()
    }
}
