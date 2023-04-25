//
//  LandmarkRow.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//
import SwiftUI

// this view is used for the landmarklist to show each title and pictre in rows
struct LandmarkRow: View {
    //landmark as a stored property of LandmarkRow.
    var landmark: Landmark

    // the body where it will show image and name of the landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()

            //if it is favourite then it will have a star image
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

//preview first and second sample element of the landmarks array used for preview.
struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        //group used as a container for grouping view content. the group’s child views are rendered as separate previews
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        // set a size that approximates a row in a list. (apply to both as its in the gorup)
    }
}
