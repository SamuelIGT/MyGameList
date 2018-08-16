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
    static let BUTTON_SHADOW_RADIUS: CGFloat = 20;
    static let CARD_VIEW_SHADOW_RADIUS: CGFloat = 20;
    static let FADE_GRADIENT_LOCATIONS: [NSNumber] = [0.0, 0.05, 0.12, 0.8, 0.92, 1.0]
    static let GAME_IMAGES_ASPECT_RATIO: CGFloat = 460 / 215  //Image dimensions
    
    //STRINGS------------------------------------------------|
    static let GAME_SELECTION_TITLE = "Discover"
    static let BTN_LIKE_TAG = 5490
    static let BTN_DISLIKE_TAG = 5480
    
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
    static let CARD_VIEW_ALPHA_ADITIONAL_CONSTANT:CGFloat = 1.1;
    static let TAB_BAR_ANIMATION:CFTimeInterval = 0.5;
    static let GRADIENT_BACKGROUND_ANIMATION:CFTimeInterval = 0.5;
    
    
    //COLORS----------------------------------------------------------------------------------------------------------------------------------------|
    static let GAME_SELECTION_BACKGROUND_GRADIENT_COLORS = [UIColor.init(hexString: "#65799B").cgColor, UIColor.init(hexString: "#5E2563").cgColor];
    static let GAMES_LIST_BACKGROUND_GRADIENT_COLORS = [UIColor.init(hexString: "#8A9CBA").cgColor, UIColor.init(hexString: "#65799B").cgColor];
    static let PRIMARY_ICON_COLOR = UIColor.init(hexString: "#F2F7FC");
    static let PRIMARY_TEXT_COLOR = UIColor.init(hexString: "#51688C");
    static let SECONDARY_TEXT_COLOR = UIColor.init(hexString: "#A5B5CD");
    static let FADE_GRADIENT_COLORS = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
}
