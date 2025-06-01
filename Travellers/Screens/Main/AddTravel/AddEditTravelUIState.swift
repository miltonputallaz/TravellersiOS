//
//  AddTravelUIState.swift
//  Travellers
//
//  Created by Milton Putallaz on 16/02/2025.
//

import PhotosUI
import SwiftUI

struct AddEditTravelUIState {
    var title: String = ""
    var description: String = ""
    var selectedImage: Data? = nil
    var invitedMails: [String] = []
    var asyncImageId: String? = nil
}
