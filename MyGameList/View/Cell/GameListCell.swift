//
//  GameListCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 29/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class GameListCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let fadeGradient = CAGradientLayer()
    private var didLayoutFadeGradient = false
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        cv.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        return cv
    }()
    
    let cellId = "cellId"
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.clear
        
        addSubview(collectionView)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addContraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        collectionView.register(ItemListCell.self, forCellWithReuseIdentifier: cellId)
        
        setGradientMask()
    }
    
    func setGradientMask(){
        fadeGradient.colors = Consts.FADE_GRADIENT_COLORS
        fadeGradient.locations = Consts.FADE_GRADIENT_LOCATIONS
        layer.mask = fadeGradient
    }
    
    override func layoutSubviews() {
        if(!didLayoutFadeGradient){
            fadeGradient.frame = collectionView.superview?.bounds ?? .null
            didLayoutFadeGradient = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (frame.width / 6)
        return CGSize(width: frame.width - 16, height: height)
    }
    
    override var alignmentRectInsets: UIEdgeInsets{
        return UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
}
