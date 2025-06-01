//
//  UserDefaults.swift
//  Travellers
//
//  Created by Milton Putallaz on 18/02/2025.
//

import Foundation
protocol UserDefaultsProtocol {
    static func setTravelsTimestamp(date: Date)
    static func getTravelsTimestamp() -> Date?
}
