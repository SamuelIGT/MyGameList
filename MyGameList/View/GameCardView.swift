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
        imageView.image = UIImage(named: "console")
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
        label.text = "Controle XBOX"
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
        //TODO: transformar as margins em variaveis para melhor organização do código
        
        let heightMarginConstrain = ((frame.height - (frame.width - 32)) / 2)
        
        addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: rateImageView)
        addContraintsWithFormat(format: "V:|-\(heightMarginConstrain)-[v0]-\(heightMarginConstrain)-|", views: rateImageView)
        
    }
    
    func setupView(){
        backgroundColor = UIColor.darkGray
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        addSubview(rateImageView)
        
        
        
//        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(self.setupSwipe))
//        addGestureRecognizer(swipeGesture)
    }
    
//    @objc func setupSwipe(_ sender: UIPanGestureRecognizer){
//        let point = sender.translation(in: superview)
//
//        center = CGPoint(x: ((superview?.center.x)! + point.x), y: ((superview?.center.y)! + point.y))
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
