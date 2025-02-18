//
//  TravelsRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Foundation

protocol TravelsRepository {
    func getTravels() async -> ResponseState<[ExternalTravel]>
    func postTravel(title: String, description: String?, image: Data?, invitedEmails: [String]?) async -> ResponseState<Void>
}

extension TravelsRepository {
    func postTravel(title: String, description: String? = nil, image: Data? = nil, invitedEmails: [String]? = nil) async -> ResponseState<Void> {
        await postTravel(title: title, description: description, image: image, invitedEmails: invitedEmails)
    }
}
