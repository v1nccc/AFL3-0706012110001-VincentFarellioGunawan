//
//  ContentView.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
                         .offset(y: -200)
                         .padding(.bottom, -200)
            VStack(alignment: .leading) {
               
                
                Text("Miko")
                        .font(.title)
                        .foregroundColor(.blue)
                
                HStack {
                    Text("National Dog Park")
                        .font(.subheadline)
                    Spacer()
                    Text("Indonesia")
                        .font(.subheadline)
                }
                Divider()

                    Text("About Miko")
                        .font(.title2)
                    Text("This is a poodle.")
             
            }   .padding()
            Spacer()
        }
 
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
