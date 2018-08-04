//
//  GamesSelectionCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 29/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GamesSelectionCell: BaseCell {
    var angleDivisor: CGFloat!
    var cardDefaultCenter: CGPoint!
    
    override func setupViews() {
        super.setupViews()
        
        let cardView = GameCardView(frame: CGRect(x: 0, y: 0, width: frame.width - 32, height: frame.height/2))
        addSubview(cardView)
        
        cardView.addViewShadow()
        cardDefaultCenter = CGPoint(x: self.center.x, y: self.center.y - (self.center.y / 8))
        cardView.center = cardDefaultCenter
        
//        let height = frame.height / 2
//        let heightMargin = frame.height / 8
//        addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: cardView)
//        addContraintsWithFormat(format: "V:[v0(\(height))]", views: cardView)
//        cardView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -heightMargin).isActive = true

        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe))
        cardView.addGestureRecognizer(swipeGesture)
        
        angleDivisor = (frame.width / 2) / Consts.CARD_VIEW_MAX_ROTATION
    }
    
    @objc func handleSwipe(_ sender: UIPanGestureRecognizer){
        let point = sender.translation(in: self)
        let card = sender.view as! GameCardView
        let xDistanceFromCenter = card.center.x - center.x
        
        let angle = (xDistanceFromCenter / frame.width) * Consts.CARD_VIEW_MAX_ROTATION
        let scale = min((Consts.CARD_VIEW_LIMIT_TO_SCALE / abs(xDistanceFromCenter)), 1)
        
        card.center = CGPoint(x: (cardDefaultCenter.x + point.x), y: (cardDefaultCenter.y /*+ point.y*/))
        card.transform = CGAffineTransform(rotationAngle: angle).scaledBy(x: scale, y: scale)
        
//        let rotation = CGFloat(atan2f(Float(card.transform.b), Float(card.transform.a))) //angle units(radiants)
//        print(rotation * (CGFloat(180) / .pi)) //angle
        
        if(xDistanceFromCenter > 0){
            card.rateImageView.image = #imageLiteral(resourceName: "Heart")
            //card.rateImageView.tintColor = .green
        }else{
            card.rateImageView.image = #imageLiteral(resourceName: "X")
            //card.rateImageView.tintColor = .red
        }
        
        card.rateImageView.alpha = abs(xDistanceFromCenter) / center.x
        
        
        if (sender.state == UIGestureRecognizerState.ended) {
            if(card.center.x < Consts.SWIPE_LIMIT){
                //Move off to the left side
                animateSwipeOff(card: card, toLeft: true)
                
            } else if(card.center.x > (frame.width - Consts.SWIPE_LIMIT)){
                //Move off to the right side
                animateSwipeOff(card: card, toLeft: false)
                
            }else{
                //Recentralize
                UIView.animate(withDuration: Consts.CARD_VIEW_RECENTRALIZE_DURATION) {
                    card.center = self.cardDefaultCenter
                    card.rateImageView.alpha = 0
                    card.transform = CGAffineTransform.identity
                }
            }
        }
    }
    
    func animateSwipeOff(card: GameCardView,toLeft: Bool){
        let xOffset:CGFloat = toLeft ? -200 : 200
        let yOffset:CGFloat = 75
        
        UIView.animate(withDuration: Consts.CARD_VIEW_SWIPE_OFF_DURATION, animations: {
            card.center = CGPoint(x: card.center.x + xOffset, y: card.center.y + yOffset)
            card.alpha = 0
        })
    }
    
}
