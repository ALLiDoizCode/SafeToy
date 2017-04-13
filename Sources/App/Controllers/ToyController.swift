//
//  ToyController.swift
//  safetoyserver
//
//  Created by Jonathan on 4/12/17.
//
//

import Vapor
import HTTP
import Foundation
import MongoKitten

final class ToyController {
    
    var db:MongoKitten.Database!
    
    func addRoutes(drop:Droplet,db:MongoKitten.Database){
        
        self.db = db
        
        let toyGroup = drop.grouped("toy")
        toyGroup.post("save",handler:saveToy)
        toyGroup.post("find", handler: getToys)
    }
    
    func saveToy(request:Request) throws -> ResponseRepresentable {
        
        guard let name = request.data["name"]?.string else {
            
            return Abort.badRequest.message
        }
        
        guard let status = request.data["status"]?.bool else {
            
            return Abort.badRequest.message
        }
        
        guard let image = request.data["image"]?.string else {
            
            return Abort.badRequest.message
        }
        
        let newToy = ToyModel(name: name, status: status, image: image)
        
        let result = DataBaseManager(db: db).save(doc: newToy.toDoc())
        
        return "\(result)"
    }
    
    func getToys(request:Request) throws -> ResponseRepresentable {
        
        guard let skip = request.data["skip"]?.int else {
            
            return Abort.badRequest.message
        }
        
        guard let limit = request.data["limit"]?.int else {
            
            return Abort.badRequest.message
        }
        
        let result = DataBaseManager(db: db).getToys(skip: skip, limit: limit)
        
        return result
        
    }
}
