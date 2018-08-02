//
//  GradientLayer.swift
//  MyGameList
//
//  Created by Samuel Alves on 02/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GradientLayer : CAGradientLayer {
    var gradient: GradientType? {
        didSet {
            startPoint = gradient?.x ?? CGPoint.zero
            endPoint = gradient?.y ?? CGPoint.zero
        }
    }
}
