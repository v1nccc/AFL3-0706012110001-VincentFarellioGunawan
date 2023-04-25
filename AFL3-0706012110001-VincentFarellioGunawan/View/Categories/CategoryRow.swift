//
//  CategoryRow.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 25/04/23.
//

import SwiftUI

struct CategoryRow: View {
    //properties of category name
    var categoryName: String
    // list of item in that category
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            //display the category name
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            //display the items in the category
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        //display the categoryitem view
                        //navigationlink to move to the details
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(3))
        )
    }
}
