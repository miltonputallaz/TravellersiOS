//
//  TravelResponse.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

struct RemoteTravelResponse: Decodable {
    let title: String
    let description: String?
    let id: String
    let owner: Bool
    let imageId: String
    
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
        case id = "id"
        case owner = "owner"
        case imageId = "imageId"
    }
    
    func toExternalModel() -> ExternalTravel {
        return ExternalTravel(title: title, description: description, id: id, owner: owner, imageId: imageId)
    }
    
}
