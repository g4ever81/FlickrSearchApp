//
//  FlickrImage.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

// MARK: - Data Model

import Foundation

struct FlickrImage: Codable, Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let published: String
    let description: String
    let media: Media
    
    struct Media: Codable {
        let m: String
    }
    
    enum CodingKeys: String, CodingKey {
        case title, author, published = "date_taken", description, media
    }
    
    // Extract plain text from the HTML description
    var plainDescription: String {
        return description
            .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // Format the published date
    var formattedDate: String {
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: published) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            outputFormatter.timeStyle = .short
            return outputFormatter.string(from: date)
        }
        return published
    }
}

struct FlickrResponse: Codable {
    let items: [FlickrImage]
}
