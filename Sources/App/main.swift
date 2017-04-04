import Vapor

let drop = Droplet()

drop.get { request in
    return try JSON(node: [
        "message":"hello vapor"
        ])
}


drop.get("hello") { request in
    return try JSON(node: [
        "message":"tired to say hello"
        ])
}

drop.get("hello", "there") { request in
    return try JSON(node: [
        "message":"tired to say hello -_-"
        ])
}

drop.get("beers", Int.self) { request, beers in
    return try JSON(node: [
        "message":"take down, pass ot around \(beers - 1) bottles of the beer on the wall..."
        ])

}

drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    
    return try JSON(node: [
        "message":"the name posted is \(name)"
        ])
}

drop.run()
