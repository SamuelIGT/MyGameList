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
        label.text = "Jogo "
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
        
        thumbnailImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/6).isActive = true
        thumbnailImageView.centerXAnchor.constraint(equalTo: leftAnchor, constant: frame.width / 12).isActive = true
        thumbnailImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: thumbnailImageView.rightAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        //thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}
