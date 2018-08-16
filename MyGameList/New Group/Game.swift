//
//  Game.swift
//  MyGameList
//
//  Created by Samuel Alves on 10/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//
import UIKit
class Game{
    
    var id: Int!
    var name: String!
    var description: String!
    var thumbnailPath: String!
    
    init(name:String, description:String, thumbnail:String) {
        self.name = name
        self.description = description
        self.thumbnailPath = thumbnail
    }
    init() {
    }
    
    
}
