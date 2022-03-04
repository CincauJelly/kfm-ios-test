//
//  CityModel.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import Foundation
import SwiftUI

struct CityModel: Codable{
    let name: String
    let lat: Float
    let lon: Float
    let country: String
    let state: String
}
