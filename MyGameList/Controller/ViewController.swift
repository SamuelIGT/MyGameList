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
        
        setupGradient()
        
        collectionView?.register(GamesSelectionCell.self, forCellWithReuseIdentifier: cellId[0])
        collectionView?.register(GameListCell.self, forCellWithReuseIdentifier: cellId[1])

        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.isPagingEnabled = true
        collectionView?.isScrollEnabled = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId[indexPath.item], for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let duration: CFTimeInterval = Consts.TAB_BAR_ANIMATION
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.65, -0.55, 0.27, 1.55); //Estilo da animação (easy-in, fade-out e etc)
        
        //Inicializa o gerenciador de animação/transição
        CATransaction.begin();
        CATransaction.setAnimationDuration(duration);
        CATransaction.setAnimationTimingFunction(timingFunction);
        
        self.menuBar.tabIndicatorBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / CGFloat(Consts.NUMBER_OF_TABS)
        
        UIView.animate(withDuration: duration){
            self.menuBar.layoutIfNeeded()
            //self.view.layoutIfNeeded()
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
    
    private func setupGradient(){
        collectionView?.backgroundView = GradientView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        collectionView?.backgroundView?.gradientLayer.colors = Consts.GAME_SELECTION_BACKGROUND_GRADIENT_COLORS
        collectionView?.backgroundView?.gradientLayer.gradient = GradientPoint.topLeftBottomRight.draw()
        
    }
    
    func scrollToTabIndex(indexPath: IndexPath){
        
       // let indexPath = IndexPath(item: tabIndex, section: 0)
        let tabIndex = indexPath.item
        self.collectionView?.scrollToItem(at: indexPath, at: .right , animated: false)
        var indexPaths = [IndexPath]()
        
       
        if(tabIndex == 1){
            let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: self.cellId[indexPath.item], for: indexPath) as! GameListCell
            cell.updateViewData()
            
            indexPaths.append(indexPath)
        }
        
        UIView.performWithoutAnimation {
            self.collectionView?.reloadItems(at: indexPaths)
        }
        
        animateGradientBackground(tabIndex)
    }
    func animateGradientBackground(_ tabIndex: Int) {
        let colors = (tabIndex == 0) ? Consts.GAME_SELECTION_BACKGROUND_GRADIENT_COLORS : Consts.GAMES_LIST_BACKGROUND_GRADIENT_COLORS
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setCompletionBlock {
            self.collectionView?.backgroundView?.gradientLayer.colors = colors
        }
        
        
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.duration = Consts.GRADIENT_BACKGROUND_ANIMATION
        gradientAnimation.toValue = colors
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.isRemovedOnCompletion = false
        collectionView?.backgroundView?.gradientLayer.add(gradientAnimation, forKey: "colorChange")
        
        CATransaction.commit()
    }
}

