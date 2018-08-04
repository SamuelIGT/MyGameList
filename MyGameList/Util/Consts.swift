//
//  Consts.swift
//  MyGameList
//
//  Created by Samuel Alves on 27/07/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//
import UIKit
class Consts{
    static let NUMBER_OF_TABS = 2;
    static let TAB_BAR_ICONS_NAME = ["Console", "List"];
    static let CARD_VIEW_CORNER_RADIUS: CGFloat = 12
    
    //ANIMATION CONSTANTS
    static let SWIPE_LIMIT:CGFloat = 75.0;
    static let CARD_VIEW_RECENTRALIZE_DURATION = 0.2;
    static let CARD_VIEW_SWIPE_OFF_DURATION = 0.3;
    static let CARD_VIEW_MAX_ROTATION:CGFloat = 0.61;//radiants(unit of angle) = 35º
    static let CARD_VIEW_LIMIT_TO_SCALE:CGFloat = 100;
    
    
    //COLORS
    static let GAME_SELECTION_BACKGROUND_GRADIENT_COLORS = [UIColor.init(hexString: "#65799B").cgColor, UIColor.init(hexString: "#5E2563").cgColor];
    
    static let GAMES_LIST_BACKGROUND_GRADIENT_COLORS = [UIColor.init(hexString: "#65799B").cgColor, UIColor.init(hexString: "#5E2563").cgColor];
    
    static let PRIMARY_ICON_COLOR = UIColor.init(hexString: "#F2F7FC")
    
}
