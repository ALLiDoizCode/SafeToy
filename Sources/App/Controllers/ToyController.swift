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
    
    func addRoutes(drop:Droplet,db:MongoKitten.Database){
        
        let toyGroup = drop.grouped("toy")
        toyGroup.post("save",handler:saveToy)
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
        
        return name
    }
}
