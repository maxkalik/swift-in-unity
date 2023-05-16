//
//  Encodable.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 5/16/23.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (
            try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            )
        ).flatMap { $0 as? [String: Any] }
    }
    
    var jsonString: String? {
        dictionary?.stringify()
    }
}
