//
//  AddTravelViewModel.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

import Foundation
import Resolver
import PhotosUI
import SwiftUI

class AddEditTravelViewModel: AddEditTravelViewModelProtocol {
    
    private var travelsRepository: TravelsRepository
    @Published var uiState = AddEditTravelUIState()
    @Published var selectedImage: PhotosPickerItem? = nil {
        didSet {
            Task {
                await setImageWithData(selectedImage: selectedImage)
            }
        }
    }
    
    init(
        travelsRepository: TravelsRepository
    ) {
        self.travelsRepository = travelsRepository
    }
    
    func addTravel() async {
        
        let image = try? await selectedImage?.loadTransferable(type: Data.self)
        
        let result = await travelsRepository.postTravel(title: uiState.title, description: uiState.description, image: image, invitedEmails: uiState.invitedMails)
        
    }
    
    @MainActor
    private func setImageWithData(selectedImage: PhotosPickerItem?) async {
        if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
            uiState.selectedImage = data
        }
    }
    
    func addEmail(_ email: String) {
        uiState.invitedMails.append(email)
    }

}
