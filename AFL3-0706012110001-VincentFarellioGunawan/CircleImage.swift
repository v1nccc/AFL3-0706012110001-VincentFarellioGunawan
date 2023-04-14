//
//  CircleImage.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("miko")
            .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
            }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
