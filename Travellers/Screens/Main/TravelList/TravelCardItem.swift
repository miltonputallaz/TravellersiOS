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
        VStack(alignment: .leading, spacing: 4) {
                
                AsyncImage(url: URL(string: "\(EndpointConst.BASE_STATICS_URL)\(travel.imageId)"))
                    { result in
                            result.image?
                                .resizable()
                                .scaledToFill()
                    }
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10, corners: [.topLeft, .topRight])
                
                HStack {
                    Text(travel.title)
                           .font(.headline)
                           .foregroundColor(.primary)
                           .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "person.fill")
                    Text("2")
                    
                    if (travel.owner) {
                        Image(systemName: "key.fill")
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom)
                
            
                if let description = travel.description {
                   Text(description)
                       .font(.subheadline)
                       .multilineTextAlignment(.leading)
                       .foregroundColor(.secondary)
                       .lineLimit(2)
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.horizontal)
                       .padding(.bottom)
               }
           }
           .background(Color(.systemBackground))
           .cornerRadius(12)
           .shadow(radius: 5)
        
    }
    
}


#Preview {
    TravelCardItem(travel: ExternalTravel(title: "Viajesito", description: "Alguna descripcion", id: "id", owner: true, imageId: ImageManager.POSSIBLE_DEFAULT_IMAGES[0])).padding()
    TravelCardItem(travel: ExternalTravel(title: "Otro Viajesito", description: nil, id: "another id", owner: false, imageId: ImageManager.POSSIBLE_DEFAULT_IMAGES[0])).padding()
}
