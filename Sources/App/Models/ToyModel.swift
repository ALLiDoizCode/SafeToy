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
    var description:String!
    var image:String!
    
    init(name:String,description:String,image:String) {
        
        self.id = nil
        self.name = name
        self.description = description
        self.image = image

    }
    
    func toDoc() -> Document{
        
        var document = Document()
        
        document["_id"] = id
        document["name"] = name
        document["description"] = description
        document["image"] = image
        
        return document
    }
    
}
