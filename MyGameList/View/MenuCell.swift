//
//  MenuCell.swift
//  MyGameList
//
//  Created by Samuel Alves on 26/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell{
    
    let imageView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "console")?.withRenderingMode(.alwaysTemplate)
//        view.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        return view
    }()
    
    override var isHighlighted: Bool{
        didSet{
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        }
    }
    
    override var isSelected: Bool{
        didSet{
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addContraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addContraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        setupView()
    }
    private func setupView(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
