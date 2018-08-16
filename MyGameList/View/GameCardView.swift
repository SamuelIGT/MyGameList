//
//  GameCardView.swift
//  MyGameList
//
//  Created by Samuel Alves on 30/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GameCardView: UIView {
    
    private var game: Game?
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "header")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let rateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabelWithPadding = {
        let label = UILabelWithPadding()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        label.textColor = Consts.PRIMARY_TEXT_COLOR
        
        label.text = "No Man's Sky"
        
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsetsMake(Consts.CARD_DESCRIPTION_PADDING_TOP, Consts.CARD_DESCRIPTION_PADDING_LEFT, Consts.CARD_DESCRIPTION_PADDING_BOTTOM, Consts.CARD_DESCRIPTION_PADDING_RIGHT)
        textView.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        textView.textColor = Consts.SECONDARY_TEXT_COLOR
        
        textView.text = "No Man's Sky is a game about exploration and survival in an infinite procedurally generated universe."
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //TODO: procurar lugar melhor pra colocar esse código
        
//        let leftMarginConstraint = frame.width / 2
//        let heightMarginConstraint = ((frame.height - (frame.width - leftMarginConstraint)) / 2)
//        
//        addContraintsWithFormat(format: "H:|-\(leftMarginConstraint / 2)-[v0]-\(leftMarginConstraint / 2)-|", views: rateImageView)
//        addContraintsWithFormat(format: "V:|-\(heightMarginConstraint)-[v0]-\(heightMarginConstraint)-|", views: rateImageView)
        
    }
    
    func setupView(){
        backgroundColor = UIColor.white
        layer.cornerRadius = Consts.CARD_VIEW_CORNER_RADIUS
        addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(descriptionTextView)
        addSubview(rateImageView)
        
        layoutRateView()
        layoutThumbnailImageView()
        layoutTitleLabel()
        layoutDescriptionTextView()
    }
    
   private func layoutRateView(){
        rateImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rateImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rateImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        rateImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        rateImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layoutThumbnailImageView(){
        thumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        setupViewsCorner(view: thumbnailImageView, corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private func layoutTitleLabel(){
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layoutDescriptionTextView(){
        descriptionTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        setupViewsCorner(view: descriptionTextView, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    }
    
    func setGame(game:Game){
        thumbnailImageView.image = UIImage(named: game.thumbnailPath)
        titleLabel.text = game.name
        descriptionTextView.text = game.description
        self.game = game
    }
    
    func getGame() -> Game{
        return self.game!
    }
    
    private func setupViewsCorner(view: UIView, corners: CACornerMask){
        view.layer.cornerRadius = Consts.CARD_VIEW_CORNER_RADIUS
        view.layer.maskedCorners = corners
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
