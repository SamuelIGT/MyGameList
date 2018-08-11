//
//  Game.swift
//  MyGameList
//
//  Created by Samuel Alves on 10/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//
import Foundation
import UIKit
class Game{
    var name: String
    var description: String
    var thumbnailPath: UIImage
    
    init(name:String, description:String, thumbnail:UIImage) {
        self.name = name
        self.description = description
        self.thumbnailPath = thumbnail
    }
}
