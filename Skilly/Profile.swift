//
//  Profile.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/15/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import Foundation
import Gloss

class Profile: Decodable, Glossy {
    
    var name: String?
    var job: String?
    var education: String?
    var location: String?
    var image: UIImage?
    var imageURL: String?
    
    
    init?() {
        self.name = ""
        self.job = ""
        self.education = ""
        self.location = ""
        self.image = nil
        self.imageURL = ""
    }
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.job = ("job" <~~ json)!
        self.education = "education" <~~ json
        self.location = "location" <~~ json
        self.imageURL = "imageURL" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "name" ~~> self.name,
            "job" ~~> self.job,
            "education" ~~> self.education,
            "location" ~~> self.location,
            "imageURL" ~~> self.imageURL
            ])
    }
    
}
