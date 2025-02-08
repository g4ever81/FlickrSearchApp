//
//  ContentView.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

import SwiftUI
import Combine
import Foundation

// MARK: - SwiftUI Views
struct SearchView: View {
    @State private var searchText = ""
    @State var images: [FlickrImage] = []
    @State private var isLoading = false
    @State private var cancellables = Set<AnyCancellable>()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onCommit: search)
                    .padding()
                    .keyboardType(.webSearch)
                
                if isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                            ForEach(images) { image in
                                NavigationLink(destination: ImageDetailView(image: image)) {
                                    AsyncImage(url: URL(string: image.media.m)) { phase in
                                        imageView(for: phase)
                                    }
                                    .frame(height: 100)
                                    .cornerRadius(8)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Flickr")
        }
    }
    
    private func search() {
        isLoading = true
        FlickrService.shared.fetchImages(for: searchText)
            .sink(receiveCompletion: { _ in
                isLoading = false
            }, receiveValue: { images in
                self.images = images
            })
            .store(in: &cancellables)
    }
    
    @ViewBuilder
    private func imageView(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .success(let image):
            let title = "defaultTitle" // Replace with an actual title if available
            image
                .resizable()
                .scaledToFit()
                .accessibilityIdentifier(title)
            
        case .failure:
            Color.pink
                .frame(height: 100)
            
        case .empty:
            ProgressView()
                .frame(height: 100)
        @unknown default:
                Color.gray
                    .frame(height: 100)
                    .overlay(Text("Unknown State").foregroundColor(.white))
        }
    }
}


