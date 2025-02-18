//
//  TravelsRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Foundation

class TravelsRepositoryImpl: TravelsRepository {
    
    private var travelsRemoteRepository: TravelsRemoteRepository
    
    init(
        travelsRemoteRepository: TravelsRemoteRepository
    ) {
        self.travelsRemoteRepository = travelsRemoteRepository
    }
    
    func getTravels() async -> ResponseState<[ExternalTravel]> {
        let result = await travelsRemoteRepository.getTravels()
        switch result {
            case .error(let error):
                return ResponseState.error(error)
            case .success(let response):
                return ResponseState.success(response.data.map { $0.toExternalModel() })
        }
    }
    
    func postTravel(title: String, description: String?,  image: Data?, invitedEmails: [String]?) async -> ResponseState<Void> {
        let result = await travelsRemoteRepository.postTravel(title: title, description: description, image: image, invitedEmails: invitedEmails)
        switch result {
            case .error(let error):
                return ResponseState.error(error)
            case .success(_):
                return ResponseState.success(Void())
        }
    }
    
    
}
