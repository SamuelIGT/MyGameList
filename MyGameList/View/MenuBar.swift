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
        cv.backgroundColor = UIColor.blue
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let cellId = "cellId"
    let imageNames = ["console", "list"]
    
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
        backgroundColor = UIColor.blue;
        
        setupTabIndicatorBar()
    }
    
    var tabIndicatorBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupTabIndicatorBar() {
        let tabIndicatorBarView = UIView()
        tabIndicatorBarView.backgroundColor = UIColor.white
        tabIndicatorBarView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tabIndicatorBarView)
        
        tabIndicatorBarLeftAnchorConstraint = tabIndicatorBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        tabIndicatorBarLeftAnchorConstraint?.isActive = true
        //tabIndicatorBarView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tabIndicatorBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tabIndicatorBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/5).isActive = true//how large the view will be
        tabIndicatorBarView.heightAnchor.constraint(equalToConstant: 8).isActive = true//how tall the view will be
        
        
        tabIndicatorBarView.layer.cornerRadius = 4
        tabIndicatorBarView.layer.masksToBounds = true
    }
    
    //Indicates the selected tab
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let x = CGFloat(indexPath.item) * frame.width/2
//        tabIndicatorBarLeftAnchorConstraint?.constant = x
//        
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {self.layoutIfNeeded()}, completion: nil)

//        let duration: CFTimeInterval = 1
//        let timingFunction = CAMediaTimingFunction(controlPoints: 0.65, -0.55, 0.27, 1.55); //Estilo da animação (easy-in, fade-out e etc)
//
//        //Inicializa o gerenciador de animação/transição
//        CATransaction.begin();
//        CATransaction.setAnimationDuration(duration);
//        CATransaction.setAnimationTimingFunction(timingFunction);
        
        self.viewController?.scrollToTabIndex(tabIndex: indexPath.item)
//        self.tabIndicatorBarLeftAnchorConstraint?.constant = ((self.viewController?.view.frame.width)! * CGFloat(indexPath.item)) / 2
//
//        UIView.animate(withDuration: 1.0) {
//            self.viewController?.view.layoutIfNeeded()
//        }
//
//        CATransaction.commit()
        
        
    }
    
    //Number of tabs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Consts.NUMBER_OF_TABS
    }
    
    //cell style
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        
        cell.backgroundColor = UIColor.cyan
        
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
