//
//  Room.swift
//  mtngRooms
//
//  Created by Mariya Arul Raj on 15/12/19.
//  Copyright © 2019 Mariya Arul Raj. All rights reserved.
//

import SwiftUI

struct Room  : Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var imageName: String { return name }
    var thumbnailName: String { return name + "Thumb" }
}

#if DEBUG
let testData = [
    Room(name: "Ecosport",  capacity: 6, hasVideo: true),
    Room(name: "Fiesta",    capacity: 7, hasVideo: true),
    Room(name: "Endeavour", capacity: 10, hasVideo: false),
    Room(name: "Figo",      capacity: 5, hasVideo: true),
    Room(name: "Ikon",      capacity: 5, hasVideo: true),
]

#endif
