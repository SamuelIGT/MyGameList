//
//  ItemListCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 30/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class ItemListCell: BaseCell {
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "header")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
        label.textColor = Consts.PRIMARY_TEXT_COLOR
        label.text = "No Man's Sky"
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = Consts.PRIMARY_ICON_COLOR
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        setupThumbnailImage()
        setupTitleLabel()
        
    }
    func setupThumbnailImage(){
        addSubview(thumbnailImageView)
        
        let leftMargin = (frame.height * Consts.GAME_IMAGES_ASPECT_RATIO) / 2
        
        thumbnailImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: Consts.GAME_IMAGES_ASPECT_RATIO).isActive = true
        thumbnailImageView.centerXAnchor.constraint(equalTo: leftAnchor, constant: leftMargin).isActive = true
        thumbnailImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        
        //titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        //thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
