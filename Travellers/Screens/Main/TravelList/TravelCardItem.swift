//
//  TravelCardItem.swift
//  Travellers
//
//  Created by Milton Putallaz on 16/02/2025.
//
import SwiftUI

struct TravelCardItem: View {
    
    private var travel: ExternalTravel
    
    init(
        travel: ExternalTravel
    ) {
        self.travel = travel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                if let imageId = travel.imageId {
                    AsyncImage(url: URL(string: "\(EndpointConst.BASE_STATICS_URL)\(imageId)"))
                        { result in
                                result.image?
                                    .resizable()
                                    .scaledToFill()
                        }
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                } else {
                    Image(TravelCardItem.POSSIBLE_DEFAULT_IMAGES.randomElement()!)
                           .resizable()
                           .scaledToFill()
                           .frame(height: 200)
                           .clipped()
                           .cornerRadius(10)
                }
            
                Text(travel.title)
                       .font(.headline)
                       .foregroundColor(.primary)
                       
                if let description = travel.description {
                   Text(description)
                       .font(.subheadline)
                       .foregroundColor(.secondary)
                       .lineLimit(2)
               }
           }
           .padding()
           .background(Color(.systemBackground))
           .cornerRadius(12)
           .shadow(radius: 5)
        
    }
    
    static let POSSIBLE_DEFAULT_IMAGES = ["defaultRoadImage", "defaultBeachImage"]
}


#Preview {
    TravelCardItem(travel: ExternalTravel(title: "Viajesito", description: "Alguna descripcion", id: "id", owner: true))
    TravelCardItem(travel: ExternalTravel(title: "Otro Viajesito", description: nil, id: "another id", owner: false))
}
