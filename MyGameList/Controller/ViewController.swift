//
//  ViewController.swift
//  MyGameList
//
//  Created by Samuel Alves on 25/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = ["selectionCellId", "listCellId"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        setupCollectionView()
        setupMenuBar()
        
    }
    func setupCollectionView(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.green;
        
        collectionView?.register(GamesSelectionCell.self, forCellWithReuseIdentifier: cellId[0])
        collectionView?.register(GameListCell.self, forCellWithReuseIdentifier: cellId[1])
        
        //collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.isPagingEnabled = true
        collectionView?.isScrollEnabled = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId[indexPath.item], for: indexPath)
        
//        let colors: [UIColor] = [UIColor.blue, .brown, .darkGray, .purple ]
//
//        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let duration: CFTimeInterval = 0.5
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.65, -0.55, 0.27, 1.55); //Estilo da animação (easy-in, fade-out e etc)
        
        //Inicializa o gerenciador de animação/transição
        CATransaction.begin();
        CATransaction.setAnimationDuration(duration);
        CATransaction.setAnimationTimingFunction(timingFunction);
        
        //self.menuBar.tabIndicatorBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 1.5
        self.menuBar.tabIndicatorBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / CGFloat(Consts.NUMBER_OF_TABS)
        
        UIView.animate(withDuration: duration){
            self.view.layoutIfNeeded()
        }
        
        CATransaction.commit();
    }
    
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.viewController = self
        return mb
    }()

    private func setupMenuBar(){
        view.addSubview(menuBar)
        view.addContraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addContraintsWithFormat(format: "V:[v0(50)]|", views: menuBar)
        
    }
    
    func scrollToTabIndex(tabIndex: Int){
        
        let indexPath = IndexPath(item: tabIndex, section: 0)
        self.collectionView?.scrollToItem(at: indexPath, at: .right , animated: true)
    }
}

