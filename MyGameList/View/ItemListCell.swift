//
//  ItemListCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 30/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class ItemListCell: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jogo "
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        addContraintsWithFormat(format: "H:|[v0]|", views: titleLabel)
        addContraintsWithFormat(format: "V:|[v0]|", views: titleLabel)
    }
}
