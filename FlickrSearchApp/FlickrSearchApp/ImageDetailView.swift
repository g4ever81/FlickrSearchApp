//
//  ImageDetailView.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // The image
                AsyncImage(url: URL(string: image.media.m)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Color.pink
                            .frame(height: 200)
                    } else {
                        ProgressView()
                            .frame(height: 200)
                    }
                }
                .cornerRadius(8)
                
                // Title
                Text(image.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .accessibilityIdentifier("ImageTitle")

                // Author
                Text("Author: \(image.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityIdentifier("ImageAuthor")

                // Published Date
                Text("Published: \(image.formattedDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .accessibilityIdentifier("ImageDate")

                // Description
                Text(image.plainDescription)
                    .font(.body)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .accessibilityIdentifier("ImageDescription")

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Image Details")
    }
}
