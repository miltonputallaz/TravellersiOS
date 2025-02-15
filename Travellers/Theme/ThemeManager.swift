//
//  ThemeManager.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol = Main()
    
    func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
}

