//
//  ModelData.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import Foundation
import Combine

//using observableobject, swiftui will update any views that need refreshing when the data changes.
final class ModelData: ObservableObject {
//array of landmarks thats initialized from landmarkData.json.
// observable object needs to publish any changes to its data so that its subscribers can pick up the change.
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    //load hikearray
    var hikes: [Hike] = load("hikeData.json")
    //instance of the user profile that persists even after the user dismisses the profile view
    @Published var profile = Profile.default
    
    //computed features array containing only the landmarks that have isFeatured set to true
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    //dictionary: category names as keys, and an array of associated landmarks for each key
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// method that fetches JSON data with a given name from the app’s main bundle.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
