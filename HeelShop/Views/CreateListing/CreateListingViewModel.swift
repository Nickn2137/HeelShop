//
//  CreateListingViewModel.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 4/22/25.
//

import SwiftUI
import PhotosUI
import Storage

@MainActor
class CreateListingViewModel: ObservableObject {
    
    // Form properties
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var price: String = ""
    @Published var image: UIImage?
    @Published var isDiscounted: Bool = false
    @Published var selectedPhotoItem: PhotosPickerItem?
    
    // Submission status
    @Published var isSubmitting: Bool = false
    @Published var errorMessage: String?
    @Published var submissionComplete: Bool = false
    
    private var homeViewModel: HomeViewModel?
    
    init(homeViewModel: HomeViewModel? = nil) {
        self.homeViewModel = homeViewModel
    }
    
    private var accountViewModel: AccountViewModel?
    
    init(homeViewModel: HomeViewModel, accountViewModel: AccountViewModel? = nil) {
            self.accountViewModel = accountViewModel
        }
    
    func loadImageFromSelectedPhoto() async {
        guard let item = selectedPhotoItem else { return }
        
        do {
            if let data = try await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                self.image = uiImage
            }
        } catch {
            self.errorMessage = "Failed to load image."
        }
    }
    
    func submitListing() async {
        guard let user = SupabaseManager.shared.client.auth.currentUser else {
            self.errorMessage = "Not logged in."
            return
        }
        
        isSubmitting = true
        defer { isSubmitting = false }
        
        var imageUrlString: String = ""
        
        // Optional image upload
        if let imageData = image?.jpegData(compressionQuality: 0.8) {
            let filePath = UUID().uuidString + ".jpg"
            let storagePath = "listing-photos"
            
            do {
                try await SupabaseManager.shared.client.storage
                    .from(storagePath)
                    .upload(filePath, data: imageData, options: FileOptions(contentType: "image/jpeg"))
                
                if let url = try? SupabaseManager.shared.client.storage
                    .from(storagePath)
                    .getPublicURL(path: filePath) {
                    imageUrlString = url.absoluteString
                }
            } catch {
                self.errorMessage = "Image upload failed."
                return
            }
        }
        
        let newPosting = NewPosting(
            title: title,
            description: description,
            price: Double(price) ?? 0.0,
            image_url: imageUrlString,
            user_id: user.id.uuidString,
            is_discounted: isDiscounted
        )
        
        do {
            try await SupabaseManager.shared.client
                .from("listings")
                .insert(newPosting)
                .execute()
            
            print("✅ Listing successfully saved.")
            self.submissionComplete = true
            homeViewModel?.getPostings()
            accountViewModel?.needsRefresh = true
        } catch {
            print("❌ Failed to insert listing:", error.localizedDescription)
            self.errorMessage = error.localizedDescription
        }
    }
}
