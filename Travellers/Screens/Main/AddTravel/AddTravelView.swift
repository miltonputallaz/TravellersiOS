//
//  AddTravelView.swift
//  Travellers
//
//  Created by Milton Putallaz on 15/02/2025.
//

import SwiftUI
import Resolver
import PhotosUI

struct AddTravelView<VM: AddTravelViewModelProtocol>: View {
    
    @StateObject var viewModel: VM = Resolver.resolve()
    @State private var uiImage: UIImage?
    @State private var newEmail: String = ""
    let defaultImage = TravelCardItem.POSSIBLE_DEFAULT_IMAGES.randomElement()!
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
        Image(uiImage: uiImage ?? UIImage(named: defaultImage)!) // Fallback to default image
                       .resizable()
                       .scaledToFill()
                       .frame(height: geometry.size.height * 0.3)
                       .clipped()
                       .cornerRadius(10)
                       .overlay {
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
                TextField(
                    String(localized: "Title"),
                    text: $viewModel.uiState.title
                ).keyboardType(.emailAddress)
                
                TextField(
                    String(localized: "Description"),
                    text: $viewModel.uiState.description
                )
                .keyboardType(.default)
                .frame(maxHeight: .infinity)
                
                VStack {
                           // Email Input Field
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
                       .padding()
                
                
                Button {
                    Task {
                        await viewModel.addTravel()
                    }
                } label: {
                    Text(String(localized: "Add Travel"))
                }
            }
        }
    }
}

#Preview {
    AddTravelView<AddTravelViewModel>().environmentObject(ThemeManager())
}

