//
//  ProfileHost.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 26/04/23.
//

import SwiftUI

struct ProfileHost: View {
    //keys off of the environment’s \.editMode.
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            //edit burron
            HStack {
                //cancel button
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                     Spacer()
                     EditButton()
                 }
            //show summary
            //shows the profile if not in edit mode
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }
            //show the edit view
            else {
                ProfileEditor(profile: $draftProfile)
                
                    // populate the editor with the correct profile data
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                // update the persistent profile when the user taps the Done
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
