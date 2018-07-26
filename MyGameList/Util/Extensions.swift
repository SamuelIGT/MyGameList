//
//  Extensions.swift
//  MyGameList
//
//  Created by Samuel Alves on 26/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

//Extension to automatically divide the rgb float value to 255.
extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(displayP3Red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
//-------------------------------------------------------------------------------------------

extension UIView{
    func addContraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraint(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

