//
//  Dummy.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 5/16/23.
//

import Foundation

struct Dummy {
    static let user1 = User(id: "1",
                            age: 18,
                            userpic: "path/to/userpic",
                            username: "username",
                            followers: ["alex", "max", "derek"],
                            scores: [
                                Score(final: 10, prevScore: 9),
                                Score(final: 77, prevScore: 76)
                            ])
    
    static let user2 = User(id: "1",
                            age: 18,
                            userpic: "path/to/userpic",
                            username: "username",
                            followers: ["alex", "max", "derek", "jared"],
                            scores: [
                                Score(final: 10, prevScore: 9),
                                Score(final: 77, prevScore: 76),
                                Score(final: 11, prevScore: 10)
                            ])
    
    static let user3 = User(id: "1",
                            age: 18,
                            userpic: "path/to/userpic",
                            username: "username",
                            followers: ["alex", "max", "derek", "jared", "jake"],
                            scores: [
                                Score(final: 10, prevScore: 9),
                                Score(final: 77, prevScore: 76),
                                Score(final: 11, prevScore: 10),
                                Score(final: 110, prevScore: 109)
                            ])
}
