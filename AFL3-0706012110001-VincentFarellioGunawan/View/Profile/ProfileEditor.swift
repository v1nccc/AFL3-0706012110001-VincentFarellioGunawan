//
//  ProfileEditor.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 26/04/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    //datepicker
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    
    var body: some View {
        List {
            HStack {
                //show the username and make editable
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            //toggle that corresponds with the user’s preference for receiving notifications about landmark-related events
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            //landmark photos have a selectable preferred season and display the labels on a vstack
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                //picker lets user choose the preffered seasonal photo
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            //make the landmark visitation goal date modifiable
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
