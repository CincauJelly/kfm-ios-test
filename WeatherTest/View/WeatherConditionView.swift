//
//  WeatherConditionView.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import SwiftUI

struct WeatherConditionView: View {
    @StateObject var viewModel =  WeatherViewModel()
    @State private var city = ""
    
    var body: some View {
        VStack{
            Group{
                Text(viewModel.timezone)
                Text(viewModel.temp)
                Text(viewModel.title)
                Text(viewModel.description)
                TextField("Kota", text: $city)
                    .padding()
                    .border(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 1))
                Button("Get New Weather", action: {
                    viewModel.getWeather(latitude: -6.2146, longitude: 106.8451)
                })
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
        }
    }
}

struct WeatherConditionView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherConditionView()
    }
}
