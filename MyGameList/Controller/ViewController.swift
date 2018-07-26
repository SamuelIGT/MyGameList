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
        
        //Gives a margin to the content and the scroll bar so they wont be hidden behind the bar
        //collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        //collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setupMenuBar()
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()

    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addContraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addContraintsWithFormat(format: "V:[v0(50)]|", views: menuBar)
        
    }
}

