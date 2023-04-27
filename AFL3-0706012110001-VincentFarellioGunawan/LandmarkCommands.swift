//
//  LandmarkCommands.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 27/04/23.
//

import SwiftUI

struct LandmarkCommands: Commands {
    //used to track the current landmark
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    var body: some Commands {
        //built-in command set that includes the command for toggling the sidebar
        SidebarCommands()
        
        CommandMenu("Landmark") {
            //button that toggles the selected landmark’s favorite status and changes appearence depending on the currently selected landmark and its state.
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                        selectedLandmark?.isFavorite.toggle()
                    }
                    //add f as keyboard shortcut
                    .keyboardShortcut("f", modifiers: [.shift, .option])
                    .disabled(selectedLandmark == nil)
        }
    }
}


//extend the FocusedValues structure with a selectedLandmark value using  SelectedLandmarkKey as a custom key
private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}


extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
