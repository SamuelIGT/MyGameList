//
//  MenuBar.swift
//  MyGameList
//
//  Created by Samuel Alves on 26/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let cellId = "cellId"
    
    var viewController: ViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addContraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
        
        //UIView Background
        backgroundColor = UIColor.clear;
        
        setupTabIndicatorBar()
    }
    
    var tabIndicatorBarLeftAnchorConstraint: NSLayoutConstraint?
    var tabIndicatorBarView = UIView()
    
        func setupTabIndicatorBar() {
        tabIndicatorBarView.backgroundColor = Consts.PRIMARY_ICON_COLOR
        tabIndicatorBarView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tabIndicatorBarView)
        
        //tabIndicatorBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tabIndicatorBarView.centerYAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tabIndicatorBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/6).isActive = true//how large the view will be
        tabIndicatorBarView.heightAnchor.constraint(equalToConstant: 12).isActive = true//how tall the view will be
        
        tabIndicatorBarView.layer.cornerRadius = 6
        tabIndicatorBarView.layer.masksToBounds = true
    }
    
    
    //Indicates the selected tab
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.viewController?.scrollToTabIndex(tabIndex: indexPath.item)
    }
    
    //Called when the cell is loaded
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(indexPath.item == 0){
            centerTabIndicator(cell: cell)
        }
    }
    
    //Positions the bar indicator at the center of the cell
    func centerTabIndicator(cell: UICollectionViewCell){
        tabIndicatorBarLeftAnchorConstraint = tabIndicatorBarView.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
        tabIndicatorBarLeftAnchorConstraint?.isActive = true
    }
    
    //Number of tabs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Consts.NUMBER_OF_TABS
    }
    
    //cell style
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: Consts.TAB_BAR_ICONS_NAME[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = Consts.PRIMARY_ICON_COLOR
//
//        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    //size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / CGFloat(Consts.NUMBER_OF_TABS), height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
