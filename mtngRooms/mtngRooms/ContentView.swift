//
//  ContentView.swift
//  mtngRooms
//
//  Created by Mariya Arul Raj on 15/12/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var rooms: [Room] = []
    
    var body: some View {
        
        List(rooms) { room in
            Image(room.thumbnailName).frame(width: 2, height: 2, alignment: .leading)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) People")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
    }
}
