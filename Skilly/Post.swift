//
//  Post.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/13/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import Foundation
import Gloss

class Post: Decodable, Glossy {
    
    var title: String?
    var price: String?
    var description: String?
    
    
    init?() {
        self.title = ""
        self.price = ""
        self.description = nil
    }
    
required init?(json: JSON) {
    self.title = "title" <~~ json
    self.price = ("price" <~~ json)!
    self.description = "description" <~~ json
}

func toJSON() -> JSON? {
    return jsonify([
        "title" ~~> self.title,
        "price" ~~> self.price,
        "description" ~~> self.description
        ])
}

}
