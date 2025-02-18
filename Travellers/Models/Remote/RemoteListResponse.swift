//
//  Untitled.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

struct RemoteListResponse<T: Decodable>: Decodable {
    let data: [T]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    func toExternalModel() -> [T] {
        return data
    }
}
