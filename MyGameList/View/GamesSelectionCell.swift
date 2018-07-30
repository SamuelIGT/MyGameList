//
//  GamesSelectionCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 29/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GamesSelectionCell: BaseCell {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.red
        
        
        let indexView = UIView()
        addSubview(indexView)
        addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: indexView)
        addContraintsWithFormat(format: "V:|-64-[v0]-64-|", views: indexView)
        
        indexView.backgroundColor = UIColor.darkGray
        indexView.layer.cornerRadius = 20
        indexView.layer.masksToBounds = true

       // let swipeGesture = UIPanGestureRecognizer(target: indexView.self, action: #selector(self.handleSwipe))
//        swipeGesture.delegate = indexView.self
        
     //   indexView.addGestureRecognizer(swipeGesture)
    }
    
/*    @objc func handleSwipe (sender: UIPanGestureRecognizer? = nil){
        print("dragin")
    }*/
}
