//
//  CityWeatherView.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import SwiftUI

struct CityWeatherView: View {
    @StateObject var viewModel =  WeatherByCityViewModel()
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
                    viewModel.getCoordinateFrom(address: city) { coordinate, error in
                        guard let coordinate = coordinate, error == nil else { return }
                        // don't forget to update the UI from the main thread
                        DispatchQueue.main.async {
                            print(city, "Location:", coordinate) // Rio de Janeiro, Brazil Location: CLLocationCoordinate2D(latitude: -22.9108638, longitude: -43.2045436)
                        }

                    }
                })
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
        }
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView()
    }
}
