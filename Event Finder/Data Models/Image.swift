//
//  Image.swift
//  Event Finder
//
//  Created by John Ingram on 4/11/23.
//

import Foundation

struct Image: Codable {
    var ratio: String
    var url: String
    var width: Int
    var height: Int
    var fallback: Bool
}