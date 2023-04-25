//
//  Badge.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
//        rotate and display copies of the badge symbol
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        //Zstack used to lay the badge’s symbol over the badge background
        ZStack {
            BadgeBackground()
            
            //Correct the size of the badge symbol by reading the surrounding geometry and scaling the symbol
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
