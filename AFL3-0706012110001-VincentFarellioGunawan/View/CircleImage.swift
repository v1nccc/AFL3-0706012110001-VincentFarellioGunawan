//
//  CircleImage.swift
//  AFL3-0706012110001-VincentFarellioGunawan
//
//  Created by Vincent on 14/04/23.
//

import SwiftUI

struct CircleImage: View {
    //stored image property
    var image: Image

    var body: some View {
        //put image as the view and set the properties to fit what we want
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
                //makes the shape circle and adjust the stroke
            }
            .shadow(radius: 7)
    }
}

// for the preview to check if its correct already
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("miko"))
    }
}
