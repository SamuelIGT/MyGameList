//
//  ViewController.swift
//  MyGameList
//
//  Created by Samuel Alves on 25/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red;
        
        setupMenuBar()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()

    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addConstrainsWi
        
    }
}

