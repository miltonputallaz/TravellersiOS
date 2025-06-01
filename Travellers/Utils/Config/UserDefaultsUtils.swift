//
//  UserDefaultsUtil.swift
//  Travellers
//
//  Created by Milton Putallaz on 18/02/2025.
//
import Foundation

struct UserDefaultsUtils: UserDefaultsProtocol {
    
    private static let userDefaults = UserDefaults.standard
    
    private static let TRAVELS_TIMESTAMP_KEY = "TRAVELS_TIMESTAMP_KEY"
    
    static func setTravelsTimestamp(date: Date) {
        userDefaults.set(date, forKey: TRAVELS_TIMESTAMP_KEY)
    }
    
    static func getTravelsTimestamp() -> Date? {
        return userDefaults.object(forKey: TRAVELS_TIMESTAMP_KEY) as? Date
    }
    
    
}
