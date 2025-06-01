//
//  AddTravelViewModelProtocol.swift
//  Travellers
//
//  Created by Milton Putallaz on 16/02/2025.
//
import Foundation
import SwiftUI
import PhotosUI

protocol AddEditTravelViewModelProtocol: ObservableObject {
    var uiState: AddEditTravelUIState { get set }
    var selectedImage: PhotosPickerItem? { get set }
    
    func addTravel() async
    func addEmail(_ email: String)
}


