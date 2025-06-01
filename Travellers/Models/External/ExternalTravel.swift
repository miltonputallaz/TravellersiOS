//
//  ExternalTravel.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

struct ExternalTravel: Hashable {
    let title: String
    var description: String? = nil
    let id: String
    let owner: Bool
    var imageId: String
    
    static func == (lhs: ExternalTravel, rhs: ExternalTravel) -> Bool {
            return lhs.id == rhs.id
        }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
