//
//  TravelsLocalRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 18/02/2025.
//

protocol TravelsLocalRepository {
    func saveTravels(_ travels: [ExternalTravel]) async
    func saveTravelsCleaning(_ travels: [RemoteTravelResponse]) async
    func getTravels() async -> [Travel]
}
