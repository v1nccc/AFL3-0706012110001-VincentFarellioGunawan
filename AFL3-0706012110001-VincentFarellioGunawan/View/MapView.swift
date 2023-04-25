//
//  MapView.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    // Create a private state variable that holds the region information for the map.
    @State private var region = MKCoordinateRegion()

    var body: some View {
        //the region is given a $ so that a binding is pass in order to make the suer able to interact with the map and the map region balue can be updated
        Map(coordinateRegion: $region)
        //triggers a calculation of the region based on the current coordinate.
            .onAppear {
                setRegion(coordinate)
            }
    }

    //method that updates the region based on a coordinate value.
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}
