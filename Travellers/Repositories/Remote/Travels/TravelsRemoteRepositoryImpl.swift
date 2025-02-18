//
//  TravelsRepositoryImpl.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//
import Alamofire
class TravelsRemoteRepositoryImpl: TravelsRemoteRepository {

    private var remoteRepository: RemoteRepository
    
    init(
        remoteRepository: RemoteRepository
    ) {
        self.remoteRepository = remoteRepository
    }
    
    func getTravels() async -> ResponseState<RemoteListResponse<RemoteTravelResponse>> {
        do {
            let result = try await remoteRepository.getDecodable(url: "\(EndpointConst.BASE_URL)\(EndpointConst.GET_TRAVELS_ENDPOINT)", type: RemoteListResponse<RemoteTravelResponse>.self, headers: nil)
            return ResponseState.success(result)
        } catch(let exception) {
            return ResponseState.error(exception.localizedDescription)
        }
    }
    
    func postTravel(title: String, description: String?, image: Data?, invitedEmails: [String]?) async -> ResponseState<Void> {
        do {
            let multipartFormData = MultipartFormData()
            multipartFormData.append(title.data(using: .utf8)!, withName: "title")
            if let description = description {
                multipartFormData.append(description.data(using: .utf8)!, withName: "description")
            }
            if let invitedEmails = invitedEmails {
                for email in invitedEmails {
                    if let emailData = email.data(using: .utf8) {
                        multipartFormData.append(emailData, withName: "invited_emails")
                    }
                }

            }
            if let image = image {
                multipartFormData.append(image, withName: "file", fileName: "image.jpg", mimeType: "image/jpeg")
            }
            let _ = try await remoteRepository.postFormData(url: "\(EndpointConst.BASE_URL)\(EndpointConst.POST_TRAVEL_ENDPOINT)", multipartFormData: multipartFormData, headers: nil)
            return ResponseState.success(Void())
        } catch(let exception) {
            return ResponseState.error(exception.localizedDescription)
        }
    }
    
    
    
    
}
