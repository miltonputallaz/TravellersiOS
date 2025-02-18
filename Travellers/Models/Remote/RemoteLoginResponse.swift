//
//  LoginResponse.swift
//  Travellers
//
//  Created by Milton Putallaz on 08/02/2025.
//

struct RemoteLoginResponse: Decodable {
    let token: String
    let tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case tokenType = "token_type"
    }
}
