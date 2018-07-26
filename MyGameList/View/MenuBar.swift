//
//  MenuBar.swift
//  MyGameList
//
//  Created by Samuel Alves on 26/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class MenuBar: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        backgroundColor = UIColor.blue;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
