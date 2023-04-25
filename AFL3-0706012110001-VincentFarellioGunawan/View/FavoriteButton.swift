//
//  FavoriteButton.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    //isSet binding that indicates the button’s current state
    @Binding var isSet: Bool

    var body: some View {
        //Button with an action that toggles the isSet state, and changes its appearance based on the state.
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
