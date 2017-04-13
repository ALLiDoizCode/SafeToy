//
//  Toy.swift
//  safetoyserver
//
//  Created by Jonathan on 4/12/17.
//
//

import Foundation
import MongoKitten

final class ToyModel {
    
    var id: String?
    var name:String!
    var status:Bool!
    var image:String!
    
    init(name:String,status:Bool,image:String) {
        
        self.id = nil
        self.name = name
        self.status = status
        self.image = image

    }
    
    func toDoc() -> Document{
        
        var document = Document()
        
        document["_id"] = id
        document["name"] = name
        document["status"] = status
        document["image"] = image
        
        return document
    }
    
}
