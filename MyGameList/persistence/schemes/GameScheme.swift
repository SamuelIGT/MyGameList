//
//  GameScheme.swift
//  MyGameList
//
//  Created by Samuel Alves on 14/08/18.
//  Copyright © 2018 Samuel Alves. All rights reserved.
//

import SQLite

class GameScheme{
    let gamesTable = Table("games")
    let id = Expression<Int>("id")
    let title = Expression<String>("title")
    let description = Expression<String>("description")
    
//    func createTables(){
//        let createTable = self.gamesTable.create { (table) in
//            table.column(self.id, primaryKey: true)
//            table.column(self.title, unique: true)
//            table.column(self.description)
//        }
//        do{
//            try self.database.run(createTable)
//        }catch{
//            print(error)
//        }
//    }
}
