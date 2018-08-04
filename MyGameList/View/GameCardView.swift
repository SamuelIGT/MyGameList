//
//  GameCardView.swift
//  MyGameList
//
//  Created by Samuel Alves on 30/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GameCardView: UIView {
    
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mario Bros"
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGray
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
        addSubview(rateImageView)
        
        
        
        layoutRateView()
        layoutThumbnailImageView()
    }
    
    func layoutRateView(){
        rateImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        rateImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rateImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        rateImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        rateImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layoutThumbnailImageView(){
        thumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2).isActive = true
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.layer.cornerRadius = Consts.CARD_VIEW_CORNER_RADIUS
        thumbnailImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func addViewShadow(){
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 4, height: 10)
        layer.shadowRadius = 20
        layer.masksToBounds = false
        layer.shouldRasterize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
