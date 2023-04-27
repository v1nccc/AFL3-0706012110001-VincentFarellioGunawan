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
//    @State private var region = MKCoordinateRegion()
    
    //takes on the medium zoom level by default
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    //Zoom enumeration to characterize the zoom level
    enum Zoom: String, CaseIterable, Identifiable {
         case near = "Near"
         case medium = "Medium"
         case far = "Far"

         var id: Zoom {
             return self
         }
     }
    
    //change the longitude and latitude delta used to construct the region property to a value depending on the zoom
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }

    var body: some View {
        //the region is given a $ so that a binding is pass in order to make the suer able to interact with the map and the map region balue can be updated (before)
        // changed to make it available for zoom
        Map(coordinateRegion: .constant(region))
     
    }

    // shows the region based on a coordinate value.
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
