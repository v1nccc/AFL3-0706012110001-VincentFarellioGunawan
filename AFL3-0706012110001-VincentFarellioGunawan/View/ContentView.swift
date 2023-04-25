//
//  ContentView.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 11/04/23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        // insers the landmarklist view
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
