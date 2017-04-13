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
    
    func getToys(skip:Int,limit:Int) -> String {
        
        var objects:Document = []
        
        do {
            
            let results = Array(try toyCollection.find(skipping: Int32(skip),limitedTo: Int32(limit)))
            
            for result in results {
                
                objects.append(result)
            }
           
        }catch{
            
        }
        
        return objects.makeExtendedJSON()
    }
}
