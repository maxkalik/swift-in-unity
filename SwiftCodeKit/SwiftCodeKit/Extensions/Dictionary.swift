//
//  Dictionary.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 5/16/23.
//

import Foundation

extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    func stringify() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self),
           let jsonText = String(data: jsonData, encoding: .utf8) {
            return jsonText
        } else {
            return nil
        }
    }
}
