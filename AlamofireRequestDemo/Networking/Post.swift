
//
//  Post.swift
//  Networking
//
//  Created by Ngoc on 9/12/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import Foundation


struct Post: Decodable {
    let userId: Int
    let id: Int
    let body: String
    let title:  String
}
