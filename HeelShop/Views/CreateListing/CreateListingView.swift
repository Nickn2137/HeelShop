//
//  CreateListingView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/22/25.
//

import SwiftUI
import PhotosUI

struct CreateListingView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CreateListingViewModel()
    
    var body: some View {
        let image = viewModel.image
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Image Picker
                    PhotosPicker(selection: $viewModel.selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                        ZStack {
                            if let image = image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(10)
                            } else {
                                VStack {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.gray)
                                    Text("Tap to choose a photo")
                                        .foregroundColor(.gray)
                                }
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .task(id: viewModel.selectedPhotoItem) {
                        await viewModel.loadImageFromSelectedPhoto()
                    }
                    // Title
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(.roundedBorder)
                    
                    // Description
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                    
                    // Price
                    TextField("Price", text: $viewModel.price)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                    
                    // Submit Button
                    Button {
                        Task {
                            await viewModel.submitListing()
                        }
                    } label: {
                        Text("Create Listing")
                            .bold()
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.tarheel)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                    
                    // Cancel
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                    .padding(.top, 10)
                    .foregroundColor(.red)
                }
                .padding()
            }
            .navigationTitle("New Listing")
        }
        .onChange(of: viewModel.submissionComplete) {
            if viewModel.submissionComplete {
                dismiss()
            }
        }
    }
}

#Preview {
    CreateListingView()
}
