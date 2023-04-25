//
//  LandmarkList.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    // modeldata used to obtain the datas of landmarks
    // using environmentobject, The modelData property gets its value automatically when change happens
    @EnvironmentObject var modelData: ModelData
    
    
    //State is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout. You use a property with the @State attribute to add state to a view.
    
    // initial falue set false
    @State private var showFavoritesOnly = false

    //Compute a filtered version of the landmarks list by checking the showFavoritesOnly property and each landmark.isFavorite value
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                //Add a Toggle view as the first child of the List view, passing a binding to showFavoritesOnly.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    // to move to the landmark detai
                    NavigationLink {
                    //pass the current landmark to the destination LandmarkDetail.
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //preview in different device types
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
