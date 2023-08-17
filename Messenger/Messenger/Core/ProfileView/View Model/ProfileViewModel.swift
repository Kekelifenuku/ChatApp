//
//  SettingsOptions.swift
//  Messenger
//
//  Created by Fenuku kekeli on 8/5/23.
//


import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    @Published var selecteditem: PhotosPickerItem? {
    didSet { Task { try await loadImage() } }
}
@Published var profileimage: Image?

func loadImage() async throws {
    guard let item = selecteditem else { return }
        guard let imageData = try await item.loadTransferable (type: Data.self) else { return }
    guard let uiImage = UIImage(data: imageData) else { return }
    self.profileimage = Image (uiImage: uiImage)
                }
}
