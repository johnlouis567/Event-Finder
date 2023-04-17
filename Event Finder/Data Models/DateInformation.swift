//
//  DateInformation.swift
//  Event Finder
//
//  Created by John Ingram on 4/16/23.
//

import Foundation

struct DateInformation: Codable, Hashable {
    var start = StartDate()
    var timezone: String = ""
    var spanMultipleDays: Bool = false
}
