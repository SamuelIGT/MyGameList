//
//  dbConnection.swift
//  MyGameList
//
//  Created by Samuel Alves on 13/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import SQLite

class GamesDbHelper{
    var database: Connection!
    let gamesTable = Table("games")
    let id = Expression<Int64>("id")
    let title = Expression<String>("title")
    let description = Expression<String>("description")
    let thumbnailPath = Expression<String>("thumbnailPath")
    
    
    init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("games").appendingPathExtension("sqlite3")
            print(fileUrl.path)
            self.database = try Connection(fileUrl.path)
        } catch{
            print(error)
        }
        
        createTable()
    }
    
    func createTable(){
        let createTable = self.gamesTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.title)
            table.column(self.description)
            table.column(self.thumbnailPath)
        }
        do{
            try self.database.run(createTable)
        }catch{
            print(error)
        }
    }
    
    func save(game:Game) -> Bool {
        let insert = gamesTable.insert(title <- game.name, description <- game.description, thumbnailPath <- game.thumbnailPath)
        do{
            try database.run(insert)
            return true
        }catch let error{
            print("insertion failed: \(error)")
            return false
        }
    }
    
    func findAll() -> [Game] {
        var games = [Game]()
        do{
            for gameRow in try database.prepare(gamesTable){
                let game = Game()
                try game.name = gameRow.get(title)
                try game.description = gameRow.get(description)
                try game.thumbnailPath = gameRow.get(thumbnailPath)
                
                games.append(game)
                
            }
        } catch let error {
            print(error)
        }
        return games
    }
    
//    func getGameById(gameId: Int) -> Game {
//        for game in try database.prepare(gamesTable.filter( bitPattern: id == gameId)) {
//            print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
//            // id: 1, name: Optional("Alice"), email: alice@mac.com
//        }
//        // SELECT * FROM "users"
//    }
}
