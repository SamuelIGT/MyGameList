//
//  GamesSelectionCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 29/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GamesSelectionCell: BaseCell {
    private var angleDivisor: CGFloat!
    private var cardDefaultCenter: CGPoint!
    private var swipeGesture: UIPanGestureRecognizer!
    private var cardsLoaded = [GameCardView]()
    private var cardHeight: CGFloat = 0
    private var cardWidth: CGFloat = 0
    
    private var mock = GamesDatabaseMock()
    //private var gameCardsMock : [GameCardView] = mock.getGamesCardViews()
    
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
        btn.imageEdgeInsets = UIEdgeInsetsMake(16, 12, 12, 12)
        btn.clipsToBounds = true
        btn.backgroundColor = Consts.PRIMARY_ICON_COLOR
        return btn
    }()
    
    let btnDislike: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Dislike"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsetsMake(16, 16, 16, 16)
        btn.clipsToBounds = true
        btn.backgroundColor = Consts.PRIMARY_ICON_COLOR
        return btn
    }()
    
    override func setupViews() {
        super.setupViews()
        
        swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe))
        cardHeight = frame.height / 2
        cardWidth = frame.width - 32
        cardDefaultCenter = CGPoint(x: self.center.x, y: self.center.y - (self.center.y / 6))
        
        prepareCardView()
        setupCard(cardView: cardsLoaded[0])
        
        prepareCardView()
        
        
        addSubview(titleLabel)
        layoutTitleLabel()
        
        addSubview(btnLike)
        addSubview(btnDislike)
        layoutButtons()
        
        angleDivisor = (frame.width / 2) / Consts.CARD_VIEW_MAX_ROTATION
    }
    
    func setupCard(cardView: GameCardView){
        addShadow(view: cardView, shadowRadius: Consts.CARD_VIEW_SHADOW_RADIUS)
        cardView.addGestureRecognizer(swipeGesture)
    }
    func prepareCardView(){
        let cardView = GameCardView(frame: CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight))
        cardView.setGame(game: mock.getGameInfo())
        
        if(cardsLoaded.count > 0){
            insertSubview(cardView, belowSubview: cardsLoaded[cardsLoaded.count - 1])
        }else{
            addSubview(cardView)
        }
        
        cardView.center = cardDefaultCenter
        cardsLoaded.append(cardView)
    }
    
    func layoutButtons(){
        let bottomAnchorConstant = (cardDefaultCenter.y - center.y) * 1.5
        let btnFrame = CGRect(x: 0, y: 0, width: frame.width / 6, height: frame.width / 6)
        
        btnLike.frame = btnFrame
        
        btnLike.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant ).isActive = true
        btnLike.rightAnchor.constraint(equalTo: rightAnchor, constant: -(cardDefaultCenter.x / 2)).isActive = true
        btnLike.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnLike.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnLike.translatesAutoresizingMaskIntoConstraints = false
        btnLike.layer.cornerRadius = frame.width / 12
        addShadow(view: btnLike, shadowRadius: Consts.BUTTON_SHADOW_RADIUS)
        btnLike.tag = Consts.BTN_LIKE_TAG
        btnLike.addTarget(self, action: #selector(self.handleActionButtons), for: .touchUpInside)
        
        btnDislike.frame = btnFrame
        
        btnDislike.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottomAnchorConstant ).isActive = true
        btnDislike.leftAnchor.constraint(equalTo: leftAnchor, constant: cardDefaultCenter.x / 2).isActive = true
        btnDislike.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnDislike.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        btnDislike.translatesAutoresizingMaskIntoConstraints = false
        btnDislike.layer.cornerRadius = frame.width / 12
        addShadow(view: btnDislike, shadowRadius: Consts.BUTTON_SHADOW_RADIUS)
        btnDislike.tag = Consts.BTN_DISLIKE_TAG
        btnDislike.addTarget(self, action: #selector(self.handleActionButtons), for: .touchUpInside)
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
        
        if(xDistanceFromCenter > 0){
            card.rateImageView.image = #imageLiteral(resourceName: "Heart")
        }else{
            card.rateImageView.image = #imageLiteral(resourceName: "X")
        }
        
        card.rateImageView.alpha = (abs(xDistanceFromCenter) / center.x) * Consts.CARD_VIEW_ALPHA_ADITIONAL_CONSTANT
        
        
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
        }) { (finished) in
            self.setupNewCard()
        }
    }
    
    func setupNewCard(){
        self.setupCard(cardView: self.cardsLoaded[1])
        cardsLoaded[0].removeFromSuperview()
        cardsLoaded.remove(at: 0)
        prepareCardView()
    }
    
    func addShadow(view: UIView, shadowRadius: CGFloat){
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 4, height: 10)
        view.layer.shadowRadius = shadowRadius
        view.layer.masksToBounds = false
       // view.layer.shouldRasterize = true
    }
    
    @objc func handleActionButtons(_ sender: UIButton){
        if(sender.tag == Consts.BTN_LIKE_TAG){
            btnSwipeOff(toLeft: false)
        }else{//== BTN_DISLIKE
            btnSwipeOff(toLeft: true)
        }
    }
    
    
    func btnSwipeOff(toLeft: Bool){
        self.cardsLoaded[0].rateImageView.image = toLeft ? #imageLiteral(resourceName: "Dislike") : #imageLiteral(resourceName: "Like")
        self.cardsLoaded[0].rateImageView.alpha = 0.2
        
        let keyframeAnimations1 = {
            let x = toLeft ? 0  : (self.cardDefaultCenter.x * 2)//cardDefaultCenter.x - cardDefaultCenter.x = 0
            let y = self.cardDefaultCenter.y
            let rotationAngle = toLeft ? -(Consts.CARD_VIEW_MAX_ROTATION / 2) : (Consts.CARD_VIEW_MAX_ROTATION / 2)
            
            self.cardsLoaded[0].center = CGPoint(x: x, y: y)
            self.cardsLoaded[0].transform = CGAffineTransform(rotationAngle: rotationAngle).scaledBy(x: 0.6, y: 0.6)
            self.cardsLoaded[0].rateImageView.alpha = 1
        }
        
        let ketframeAnimtions2 = {
            let xOffset:CGFloat = toLeft ? -200 : 200
            let yOffset:CGFloat = 75
            
            self.cardsLoaded[0].center = CGPoint(x: self.cardsLoaded[0].center.x + xOffset, y: self.cardsLoaded[0].center.y + yOffset)
            self.cardsLoaded[0].alpha = 0
        }
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: keyframeAnimations1)
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: ketframeAnimtions2)
        }) { (finished) in
            self.setupNewCard()
        }
    }
    
}
