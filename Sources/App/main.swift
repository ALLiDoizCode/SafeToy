import Vapor
import MongoKitten

let drop = Droplet()

let server = try Server(mongoURL: "mongodb://heroku_lbjdb13z:ku67shqj08gv3731n3di33625u@ds137760.mlab.com:37760/heroku_lbjdb13z")
let database = server["heroku_lbjdb13z"]

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
