//
//  AddPostDelegate.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/13/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import Foundation

protocol AddPostDelegate {
    func didSavePost(activity: Post)
    func didCancelPost()
}
