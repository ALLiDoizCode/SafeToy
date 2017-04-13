//
//  DataBaseManager.swift
//  safetoyserver
//
//  Created by Jonathan on 4/12/17.
//
//

import Foundation
import MongoKitten

class DataBaseManager {
    
    var toyCollection:MongoKitten.Collection!
    
    init(db:MongoKitten.Database) {
        
        toyCollection = db["Toy"]
    }
    
    func save(doc:Document) -> String{
        
        do {
            
            try toyCollection.insert(doc)
            
        }catch {
            
            return "\(false)"
        }
        
        return "\(true)"
    }
}
