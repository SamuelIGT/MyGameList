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
    
    func setupView(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
