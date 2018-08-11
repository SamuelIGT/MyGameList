//
//  GamesDatabaseMock.swift
//  MyGameList
//
//  Created by Samuel Alves on 10/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import Foundation

class GamesDatabaseMock{
    private var currentIndex = 0
    private var games:[Game] = []
    
    init() {
        getGames()
    }
    
    func getGames() {
        games.append(Game(name: "The Elder Scrolls V: Skyrim", description: "EPIC FANTASY REBORN The next chapter in the highly anticipated Elder Scrolls saga arrives from the makers of the 2006 and 2008 Games of the Year, Bethesda Game Studios. Skyrim reimagines and revolutionizes the open-world fantasy epic, bringing to life a complete virtual world open for you to explore.", thumbnail: #imageLiteral(resourceName: "skyrim")))
        
        games.append(Game(name: "MONSTER HUNTER: WORLD", description: "Welcome to a new world! In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.", thumbnail: #imageLiteral(resourceName: "monster hunter")))
        
        games.append(Game(name: "PLAYERUNKNOWN'S BATTLEGROUNDS", description: "PLAYERUNKNOWN'S BATTLEGROUNDS is a battle royale shooter that pits 100 players against each other in a struggle for survival. Gather supplies and outwit your opponents to become the last person standing.", thumbnail: #imageLiteral(resourceName: "pubg")))
        
        games.append(Game(name: "Sniper Elite 4", description: "Discover unrivalled sniping freedom in the largest and most advanced World War 2 shooter ever built. Experience tactical third-person combat, gameplay choice and epic longshots across gigantic levels as you liberate wartime Italy from the grip of Fascism.", thumbnail: #imageLiteral(resourceName: "sniper elite 4")))
        
        games.append(Game(name: "Counter-Strike: Global Offensive", description: "Counter-Strike: Global Offensive (CS: GO) will expand upon the team-based action gameplay that it pioneered when it was launched 14 years ago. CS: GO features new maps, characters, and weapons and delivers updated versions of the classic CS content (de_dust2, etc.).", thumbnail: #imageLiteral(resourceName: "cs_go")))
        
        games.append(Game(name: "DOOM", description: "Now includes all three premium DLC packs (Unto the Evil, Hell Followed, and Bloodfall), maps, modes, and weapons, as well as all feature updates including Arcade Mode, Photo Mode, and the latest Update 6.66, which brings further multiplayer improvements as well as revamps multiplayer progression.", thumbnail: #imageLiteral(resourceName: "doom")))

        games.append(Game(name: "No Man's Sky", description: "No Man's Sky is a game about exploration and survival in an infinite procedurally generated universe.", thumbnail: #imageLiteral(resourceName: "header")))
    }
    
    func getGamesCardViews() -> [GameCardView]{
        var cards: [GameCardView] = []
        getGames()
        for game in games {
            let card = GameCardView()
            card.thumbnailImageView.image = game.thumbnailPath
            card.titleLabel.text = game.name
            card.descriptionTextView.text = game.description
            cards.append(card)
        }
        
        return cards
    }
    
    func setCardsGameInfo(card:GameCardView){
        card.titleLabel.text = games[currentIndex].name
        card.descriptionTextView.text = games[currentIndex].description
        card.thumbnailImageView.image = games[currentIndex].thumbnailPath
        
        if(currentIndex == games.count-1){
            currentIndex = 0
        }else{
            currentIndex += 1
        }
    }
    
    
}
