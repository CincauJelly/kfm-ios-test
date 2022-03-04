//
//  GetCityView.swift
//  WeatherTest
//
//  Created by Shiddiq Syuhada on 04/03/22.
//

import SwiftUI

struct GetCityView: View {
    @StateObject var cityModel = CityViewModel()

    var body: some View {
        VStack{
            Group{
                Text(String(cityModel.lon))
                Text(String(cityModel.lat))
                Text(cityModel.name)
                Text(cityModel.state)
                Text(cityModel.country)
                Button("Get City", action:{
                    cityModel.getCoordinates(city: "Jakarta")
                })
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

struct GetCityView_Previews: PreviewProvider {
    static var previews: some View {
        GetCityView()
    }
}
