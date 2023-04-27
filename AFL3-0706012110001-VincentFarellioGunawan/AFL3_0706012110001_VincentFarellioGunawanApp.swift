//
//  AFL3_0706012110001_VincentFarellioGunawanApp.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 11/04/23.
//

import SwiftUI

@main
struct AFL3_0706012110001_VincentFarellioGunawan: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .commands {
                LandmarkCommands()
            }
        //scene modifier
        
        //show settings if in mac os
        #if os(macOS)
            Settings {
                LandmarkSettings()
            }
            #endif
    }
}
