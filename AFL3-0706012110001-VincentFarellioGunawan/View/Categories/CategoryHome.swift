//
//  CategoryHome.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 25/04/23.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        //host different categories with the navigation view
        NavigationView {
            //display categories with a list
            List {
                //add the image of the first featured landmark to the top of the list
                modelData.features[0].image
                                 .resizable()
                                 .scaledToFill()
                                 .frame(height: 200)
                                 .clipped()
                                 .listRowInsets(EdgeInsets())
                                //make content extend to the edges of the display

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    //pass category information to instances of the row type
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                .listRowInsets(EdgeInsets())
                //make content extend to the edges of the display
                }
                      .navigationTitle("Featured")
                .navigationTitle("Featured")
          }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
