//
//  ContentView.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 11/04/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    //state variable for the tab selection
    @State private var selection: Tab = .featured
    
    //show a tab view that lets the user choose between the category or list of landmarks
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
//     wraps the LandmarkList and CategoryHome
        TabView(selection: $selection) {
            CategoryHome()
            // give label
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            // inserst the landmarklist view
            LandmarkList()
            //give label
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            //tag is used to coordinate the tab view on which to display
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
