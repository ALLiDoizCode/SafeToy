import Vapor
import MongoKitten

let drop = Droplet()

let server = try Server(mongoURL: "mongodb://heroku_b5f4gqm9:tiankpljohrrqsd1qplmpj58am@ds159330.mlab.com:59330/heroku_b5f4gqm9")
let database = server["heroku_b5f4gqm9"]

let toy = ToyController()

toy.addRoutes(drop:drop,db:database)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("version") { request in
    ///
    if server.isConnected {
        return "Connected successfully to server"
        
    }else {
        
        return " Did not Connect successfully to server)"
    }
    
}

drop.resource("posts", PostController())

drop.run()
