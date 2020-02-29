//
//  ContentView.swift
//  myAlert
//
//  Created by Mariya Arul Raj on 14/12/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            CircleImage()
            Text("I am, Mariya!")
                .font(.title)
                .foregroundColor(Color.green)
            HStack{
                Text("an iOS Developer,")
                    .font(.subheadline)
                Text("Chennai")
                    .font(.subheadline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
