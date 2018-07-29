//
//  GameListCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 29/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GameListCell: BaseCell {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.brown
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.gray
        
        addSubview(collectionView)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addContraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
    }
}
