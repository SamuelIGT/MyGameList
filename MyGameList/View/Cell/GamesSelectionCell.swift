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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = .white
        label.text = Consts.GAME_SELECTION_TITLE
        return label
    }()
    
    let btnLike: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Like"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.clipsToBounds = true
        btn.imageEdgeInsets = UIEdgeInsetsMake(16, 12, 12, 12)
        btn.backgroundColor = Consts.PRIMARY_ICON_COLOR
        return btn
    }()
    
    let btnDislike: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Dislike"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageView?.clipsToBounds = true
        btn.imageEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12)
        btn.backgroundColor = Consts.PRIMARY_ICON_COLOR
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
        
        let cardHeight = frame.height / 2
        let cardWidth = frame.width - 32
        let cardView = GameCardView(frame: CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight))
        addSubview(cardView)
        cardView.addViewShadow()

        cardDefaultCenter = CGPoint(x: self.center.x, y: self.center.y - (self.center.y / 6))
        cardView.center = cardDefaultCenter

        
        addSubview(titleLabel)
        layoutTitleLabel()
        
        addSubview(btnLike)
        addSubview(btnDislike)
        layoutButtons()
        
//        let height = frame.height / 2
//        let heightMargin = frame.height / 8
//        addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: cardView)
//        addContraintsWithFormat(format: "V:[v0(\(height))]", views: cardView)
//        cardView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -heightMargin).isActive = true

        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe))
        cardView.addGestureRecognizer(swipeGesture)
        
        angleDivisor = (frame.width / 2) / Consts.CARD_VIEW_MAX_ROTATION
    }
    
    func layoutButtons(){
        let bottomAnchorConstant = (cardDefaultCenter.y - center.y) * 1.5
        btnLike.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant ).isActive = true
        btnLike.rightAnchor.constraint(equalTo: rightAnchor, constant: -(cardDefaultCenter.x / 2)).isActive = true
        btnLike.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnLike.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnLike.translatesAutoresizingMaskIntoConstraints = false
        btnLike.layer.cornerRadius = frame.width / 12
        
        btnDislike.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant ).isActive = true
        btnDislike.leftAnchor.constraint(equalTo: leftAnchor, constant: cardDefaultCenter.x / 2).isActive = true
        btnDislike.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnDislike.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnDislike.translatesAutoresizingMaskIntoConstraints = false
        btnDislike.layer.cornerRadius = frame.width / 12
    }
    
    func layoutTitleLabel(){
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: center.y - cardDefaultCenter.y).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
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
        }else{
            card.rateImageView.image = #imageLiteral(resourceName: "X")
        }
        
        card.rateImageView.alpha = (abs(xDistanceFromCenter) / center.x) + Consts.CARD_VIEW_ALPHA_ADITIONAL_CONSTANT
        
        
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
