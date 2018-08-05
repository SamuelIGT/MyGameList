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
    static let CARD_VIEW_CORNER_RADIUS: CGFloat = 6;
    
    //STRINGS------------------------------------------------|
    static let GAME_SELECTION_TITLE = "Discover"
    
    //MARGINS AND PADDINGS-----------------------------------|
    static let CARD_TITLE_PADDING_TOP: CGFloat = 8;
    static let CARD_TITLE_PADDING_BOTTOM: CGFloat = 8;
    static let CARD_TITLE_PADDING_LEFT: CGFloat = 16;
    static let CARD_TITLE_PADDING_RIGHT: CGFloat = 0;
    
    static let CARD_DESCRIPTION_PADDING_TOP: CGFloat = 0;
    static let CARD_DESCRIPTION_PADDING_BOTTOM: CGFloat = 8;
    static let CARD_DESCRIPTION_PADDING_LEFT: CGFloat = 12;
    static let CARD_DESCRIPTION_PADDING_RIGHT: CGFloat = 8;
    
    
    //ANIMATION CONSTANTS-------------------------------------|
    static let SWIPE_LIMIT:CGFloat = 75.0;
    static let CARD_VIEW_RECENTRALIZE_DURATION = 0.2;
    static let CARD_VIEW_SWIPE_OFF_DURATION = 0.3;
    static let CARD_VIEW_MAX_ROTATION:CGFloat = 0.61;//radiants(unit of angle) = 35º
    static let CARD_VIEW_LIMIT_TO_SCALE:CGFloat = 100;
    static let CARD_VIEW_ALPHA_ADITIONAL_CONSTANT:CGFloat = 0.1;
    
    //COLORS----------------------------------------------------------------------------------------------------------------------------------------|
    static let GAME_SELECTION_BACKGROUND_GRADIENT_COLORS = [UIColor.init(hexString: "#65799B").cgColor, UIColor.init(hexString: "#5E2563").cgColor];
    static let GAMES_LIST_BACKGROUND_GRADIENT_COLORS = [UIColor.init(hexString: "#65799B").cgColor, UIColor.init(hexString: "#5E2563").cgColor];
    static let PRIMARY_ICON_COLOR = UIColor.init(hexString: "#F2F7FC");
    static let PRIMARY_TEXT_COLOR = UIColor.init(hexString: "#51688C");
    static let SECONDARY_TEXT_COLOR = UIColor.init(hexString: "#A5B5CD");
}
