//
//  GradientView.swift
//  MyGameList
//
//  Created by Samuel Alves on 02/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override public class var layerClass: Swift.AnyClass {
        get {
            return GradientLayer.self
        }
    }
}
