//
//  RandomUser.swift
//  randomUserTestPrjc
//
//  Created by OverPowerPWND Keeper83 on 20/10/22.
//

import Foundation

struct UserResult: Codable {
    let results: [User]
}

struct User: Codable {
    var name: Name
    var email: String
    var phone: String
    var picture: Picture
}

struct Name: Codable {
    var first: String
    var last: String
}

struct Picture: Codable {
    let large, medium, thumbnail: URL
}
