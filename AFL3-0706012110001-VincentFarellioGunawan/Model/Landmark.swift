//
//  Landmark.swift
//  AFL3-0706012110001-VincentFarellioGunawanUITests
//
//  Created by Vincent on 14/04/23.
//
import Foundation
import SwiftUI
import CoreLocation

//declare conformance to the Identifiable protocol (Identifiable).
struct Landmark: Hashable, Codable, Identifiable {
    //the properties match names of some of the keys in the landmarkData.json data file
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    //used to differentiate favourite landmarks and not
    
    //Add an imageName property used to read the name of the image from the data, and a computed image property that loads an image from the asset catalog.
    private var imageName: String
    var image: Image {
        Image(imageName)
    }


    private var coordinates: Coordinates
    
    // the locationCoordinate property will take the coordinates data and interact with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    // coordinates property using a nested Coordinates type that reflects the storage in the JSON data structure.
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
