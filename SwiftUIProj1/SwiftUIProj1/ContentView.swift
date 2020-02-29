//
//  ContentView.swift
//  SwiftUIProj1
//
//  Created by Mariya Arul Raj on 16/12/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let myName = Text("Mariya")
    let mySpouseName = Text("Preeths")
    var ourName = Text("Mariya Preeths")
    
    var body: some View {
        VStack (spacing: 10){
            myName
                .padding()
                .foregroundColor(.green)
                .background(Color.yellow)
                .clipShape(Capsule())
            mySpouseName
                .foregroundColor(.blue)
                .padding()
                .background(Color.yellow)
                .clipShape(Capsule())
            ourName
                .foregroundColor(.orange)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
