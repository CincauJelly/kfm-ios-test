//
//  ContentView.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 03/03/22.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var locationViewModel = LocationViewModel()
//    @State private var city: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                CityWeatherView()
//                WeatherConditionView()
                
//                switch locationViewModel.authorizationStatus {
//                case .notDetermined:
//                    AnyView(RequestLocationView())
//                        .environmentObject(locationViewModel)
//                case .restricted:
//                    ErrorView(errorText: "Location use is restricted.")
//                case .denied:
//                    ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
//                case .authorizedAlways, .authorizedWhenInUse:
//                    TrackingView()
//                        .environmentObject(locationViewModel)
//                default:
//                    Text("Unexpected status")
//                }
            }
            .padding()
        }
        .navigationTitle("Weather")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
