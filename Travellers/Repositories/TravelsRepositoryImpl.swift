//
//  TravelsRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Foundation

class TravelsRepositoryImpl: TravelsRepository {
    
    private var travelsRemoteRepository: TravelsRemoteRepository
    private var travelsLocalRepository: TravelsLocalRepository
    
    init(
        travelsRemoteRepository: TravelsRemoteRepository,
        travelsLocalRepository: TravelsLocalRepository
    ) {
        self.travelsRemoteRepository = travelsRemoteRepository
        self.travelsLocalRepository = travelsLocalRepository
    }
    
    func getTravelsFromBackend() async -> ResponseState<[ExternalTravel]> {
        let result = await travelsRemoteRepository.getTravels()
        switch result {
            case .error(let error):
                return ResponseState.error(error)
            case .success(let response):
                await saveLocalTravelsCleaning(response.data)
                UserDefaultsUtils.setTravelsTimestamp(date: Date())
                return ResponseState.success(response.data.map { $0.toExternalModel() })
        }
    }
    
    func getTravelsFromLocal() async -> ResponseState<[ExternalTravel]> {
        let result = await travelsLocalRepository.getTravels()
        return ResponseState.success(result.map { $0.toExternalModel() })
    }
    
    func saveLocalTravelsCleaning(_ travels: [RemoteTravelResponse]) async {
        await travelsLocalRepository.saveTravelsCleaning(travels)
    }
    
    func getTravelIfNecessary() async -> ResponseState<[ExternalTravel]> {
        if let travelTimestamp = UserDefaultsUtils.getTravelsTimestamp() {
            if travelTimestamp.addingTimeInterval(TRAVELS_REFRESH_TIME) < Date() {
                return await getTravelsFromBackend()
            } else {
                return await getTravelsFromLocal()
            }
        } else {
            return await getTravelsFromBackend()
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
    
    private let TRAVELS_REFRESH_TIME: TimeInterval = 60 * 60
}
