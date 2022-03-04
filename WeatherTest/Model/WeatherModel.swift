//
//  WeatherModel.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 03/03/22.
//

import SwiftUI

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
    
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
}
