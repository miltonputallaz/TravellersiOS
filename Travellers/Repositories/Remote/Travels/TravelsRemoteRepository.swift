//
//  TravelsRepository.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Foundation
protocol TravelsRemoteRepository {
    func getTravels() async -> ResponseState<RemoteListResponse<RemoteTravelResponse>>
    func postTravel(title: String, description: String?, image: Data?, invitedEmails: [String]?) async -> ResponseState<Void>
}
