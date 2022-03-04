//
//  WeatherByCityModel.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import Foundation

struct WeatherByCityModel: Codable{
    let coord: CoordModel
    let weather: [WeathersModel]
//    let base: String
    let main: MainModel
//    let visibility: Float
//    let wind: WindModel
//    let clouds: CloudModel
//    let dt: Float
    let sys: SysModel
//    let timezone: Float
    let id: Int
    let name: String
//    let cod: String
}
struct CoordModel: Codable {
    let lon: Float
    let lat: Float
}
struct WeathersModel: Codable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}
struct MainModel:Codable{
    let temp: Float
}
//struct WindModel:Codable{
//    let speed: Float
//    let deg: Float
//}
//struct CloudModel:Codable{
//    let all: Float
//}
struct SysModel:Codable{
    let id: Int
    let country: String
}
