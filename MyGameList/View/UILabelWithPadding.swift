//
//  UILabelWithPadding.swift
//  MyGameList
//
//  Created by Samuel Alves on 05/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import UIKit

class UILabelWithPadding: UILabel {
        
    var topInset: CGFloat = Consts.CARD_TITLE_PADDING_TOP
    var bottomInset: CGFloat = Consts.CARD_TITLE_PADDING_BOTTOM
    var leftInset: CGFloat = Consts.CARD_TITLE_PADDING_LEFT
    var rightInset: CGFloat = Consts.CARD_TITLE_PADDING_RIGHT
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
