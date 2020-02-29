//
//  CircleImage.swift
//  myAlert
//
//  Created by Mariya Arul Raj on 14/12/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")    .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 2))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
