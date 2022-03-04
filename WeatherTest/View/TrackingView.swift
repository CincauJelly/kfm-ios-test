//
//  TrackingView.swift
//  Core Location Test
//
//  Created by Shiddiq Syuhada on 03/03/22.
//

import SwiftUI
import CoreLocation

struct TrackingView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    var body: some View {
        VStack {
            VStack {
                PairView(
                    leftText: "Latitude:",
                    rightText: String(coordinate?.latitude ?? 0)
                )
                PairView(
                    leftText: "Longitude:",
                    rightText: String(coordinate?.longitude ?? 0)
                )
                PairView(
                    leftText: "Altitude",
                    rightText: String(locationViewModel.lastSeenLocation?.altitude ?? 0)
                )
                PairView(
                    leftText: "Speed",
                    rightText: String(locationViewModel.lastSeenLocation?.speed ?? 0)
                )
                PairView(
                    leftText: "Country",
                    rightText: locationViewModel.currentPlacemark?.country ?? ""
                )
                PairView(leftText: "State", rightText: locationViewModel.currentPlacemark?.administrativeArea ?? ""
                )
                PairView(leftText: "City", rightText: locationViewModel.currentPlacemark?.locality ?? "")
            }
            .padding()
        }
    }
    
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
