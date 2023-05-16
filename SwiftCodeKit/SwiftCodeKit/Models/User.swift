//
//  User.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 5/16/23.
//

import Foundation

public struct User: Codable {
    let id: String
    let age: Int
    let userpic: String
    let username: String
    let followers: [String]
    let scores: [Score]
}
