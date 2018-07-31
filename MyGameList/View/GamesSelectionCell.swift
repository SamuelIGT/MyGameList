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
        
        
        let cardView = GameCardView()
        addSubview(cardView)
        addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: cardView)
        addContraintsWithFormat(format: "V:|-64-[v0]-64-|", views: cardView)

        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe))
        cardView.addGestureRecognizer(swipeGesture)
        
    }
    
    @objc func handleSwipe(_ sender: UIPanGestureRecognizer){
        let point = sender.translation(in: self)
        let card = sender.view as! GameCardView
        let xDistanceFromCenter = card.center.x - center.x
        
        card.center = CGPoint(x: (self.center.x + point.x), y: (self.center.y + point.y))
        
        if(xDistanceFromCenter > 0){
            card.rateImageView.image = #imageLiteral(resourceName: "thumb-up-button")
            card.rateImageView.tintColor = .green
        }else{
            card.rateImageView.image = #imageLiteral(resourceName: "thumb-down-button")
            card.rateImageView.tintColor = .red
        }
        
        card.rateImageView.alpha = abs(xDistanceFromCenter) / center.x
        
        if (sender.state == UIGestureRecognizerState.ended) {
            UIView.animate(withDuration: 0.2) {
                card.center = self.center
                card.rateImageView.alpha = 0
            }
        }
    }
    
}
