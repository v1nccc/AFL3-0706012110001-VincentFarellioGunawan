//
//  LandmarkDetail.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    
    // all the data here is essentially taken from the landmark data that the "coordinate/which landmark" is passed form the landamrklist
    var body: some View {
        //use scrolview so it can be scrolled to fit many contents
        ScrollView {
            
            //the mapview is put here with the coordinate taken from the landmark data
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            //vstack is used to adjust the items vertically
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    //binding to the isFavorite property with the dollar sign ($)
                    // landmarkIndex is used with the modelData object to ensure that the button updates the isFavorite property of the landmark stored in the model object.
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                //hstack is used to adjust the items horizontally
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


//used for preview, call out any data of landmark
struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[1])
            .environmentObject(modelData)
    }
}
