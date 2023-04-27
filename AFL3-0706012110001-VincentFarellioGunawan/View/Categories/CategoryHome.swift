//
//  CategoryHome.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 25/04/23.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        //host different categories with the navigation view
        NavigationView {
            //display categories with a list
            List {
                //featuted landmark in carousel by taking the
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                                 .listRowInsets(EdgeInsets())
                                //make content extend to the edges of the display

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    //pass category information to instances of the row type
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                .listRowInsets(EdgeInsets())
                //make content extend to the edges of the display
                }
                .listStyle(.inset)
                      .navigationTitle("Featured")
                .navigationTitle("Featured")
            //button to show profile
                .toolbar {
                             Button {
                                 showingProfile.toggle()
                             } label: {
                                 Label("User Profile", systemImage: "person.crop.circle")
                             }
                         }
                         .sheet(isPresented: $showingProfile) {
                             ProfileHost()
                                 .environmentObject(modelData)
                         }
          }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
