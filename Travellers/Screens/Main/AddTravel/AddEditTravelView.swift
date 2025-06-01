//
//  AddTravelView.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

import SwiftUI
import Resolver
import PhotosUI

struct AddEditTravelView<VM: AddEditTravelViewModelProtocol>: View {
    
    @StateObject var viewModel: VM = Resolver.resolve()
    @State private var uiImage: UIImage?
    @State private var newEmail: String = ""
    let defaultImage = ImageManager.POSSIBLE_DEFAULT_IMAGES.randomElement()!
    
    private var externalTravel: ExternalTravel?
    
    init(_ travel: ExternalTravel?) {
        self.externalTravel = travel
    }
    
    var body: some View {
        GeometryReader { geometry in
        VStack(spacing: 10) {
            if let selectedImage = viewModel.uiState.selectedImage {
                Image(uiImage: uiImage! ) // Fallback to default image
                               .resizable()
                               .scaledToFill()
                               .frame(height: geometry.size.height * 0.3)
                               .clipped()
                               .overlay(alignment: .topTrailing) {
                                   PhotosPicker(selection: $viewModel.selectedImage,
                                                matching: .images,
                                                photoLibrary: .shared()) {
                                       Image(systemName: "pencil.circle.fill")
                                           .symbolRenderingMode(.multicolor)
                                           .font(.system(size: 30))
                                           .foregroundColor(.secondary)
                                   }
                                   .buttonStyle(.borderless)
                               }
                                .onChange(of: viewModel.uiState.selectedImage) { newImageData in
                                    if let data = newImageData, let newUIImage = UIImage(data: data) {
                                        uiImage = newUIImage // Update the UI with the selected image
                                    }
                                }
             
            } else {
                AsyncImage(url: URL(string: "\(EndpointConst.BASE_STATICS_URL)\(viewModel.uiState.asyncImageId)")) { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                    }
                    .frame(height: geometry.size.height * 0.3)
                    .clipped()
                    .overlay(alignment: .topTrailing) {
                        PhotosPicker(selection: $viewModel.selectedImage,
                                     matching: .images,
                                     photoLibrary: .shared()) {
                            Image(systemName: "pencil.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 30))
                                .foregroundColor(.secondary)
                        }
                        .buttonStyle(.borderless)
                    }
                     .onChange(of: viewModel.uiState.selectedImage) { newImageData in
                         if let data = newImageData, let newUIImage = UIImage(data: data) {
                             uiImage = newUIImage // Update the UI with the selected image
                         } else {
                             uiImage = UIImage(named: defaultImage) // Fallback to default
                         }
                     }
            }
            
            
                    TextField(
                        String(localized: "Title"),
                        text: $viewModel.uiState.title
                    ).keyboardType(.emailAddress)
                    
                    TextField(
                        String(localized: "Description"),
                        text: $viewModel.uiState.description
                    )
                    .keyboardType(.default)
                
                    
                    VStack(alignment: .leading) {
                        Image(systemName: "person.3.fill")
                        HStack {
                           TextField("Enter email", text: $newEmail)
                               .textFieldStyle(RoundedBorderTextFieldStyle())

                           Button("Add") {
                               viewModel.addEmail(newEmail)
                               newEmail = ""  // Clear input after adding
                           }
                           .disabled(newEmail.isEmpty)
                       }
                       .padding()
                            

                               // List of Emails
                               List {
                                   ForEach($viewModel.uiState.invitedMails, id: \.self) { email in
                                       HStack {
                                           Text(email.wrappedValue)
                                           Spacer()
                                           /*Button(action: {
                                               if let index = viewModel..firstIndex(of: email) {
                                                   viewModel.removeEmail(at: index)
                                               }
                                           }) {
                                               Image(systemName: "trash")
                                                   .foregroundColor(.red)
                                           }*/
                                       }
                                   }
                               }
                           }
                           
                    
                    
                    Button {
                        Task {
                            await viewModel.addTravel()
                        }
                    } label: {
                        Text(String(localized: "Add Travel"))
                    }
                }
        }.onAppear {
            
            if let travel = externalTravel {
                viewModel.uiState.description = travel.description ?? ""
                viewModel.uiState.title = travel.title
                viewModel.uiState.asyncImageId = travel.imageId
            } else {
                viewModel.uiState.asyncImageId = defaultImage
            }
        }
    }
}

#Preview {
    AddEditTravelView<AddEditTravelViewModel>(ExternalTravel(title: "Travel title", description: "Travel description", id: "sda", owner: false, imageId: ImageManager.POSSIBLE_DEFAULT_IMAGES[0])).environmentObject(ThemeManager())
    
    AddEditTravelView<AddEditTravelViewModel>(nil).environmentObject(ThemeManager())
}


