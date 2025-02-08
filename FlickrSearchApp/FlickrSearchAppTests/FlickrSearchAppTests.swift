//
//  FlickrSearchAppTests.swift
//  FlickrSearchAppTests
//
//  Created by Gaurav Mehta on 2/8/25.
//

import XCTest
import Combine

@testable import FlickrSearchApp

class FlickrImageTests: XCTestCase {
    func testFlickrImageDecoding() {
        // Sample JSON data for a Flickr image
        let json = """
        {
            "title": "Test Image",
            "author": "nobody@flickr.com (John Doe)",
            "date_taken": "2023-10-01T12:00:00-08:00",
            "description": "This is a <b>test</b> image.",
            "media": {
                "m": "https://example.com/image.jpg"
            }
        }
        """
        
        // Convert JSON to Data
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to convert JSON to Data")
            return
        }
        
        // Decode JSON into FlickrImage
        do {
            let image = try JSONDecoder().decode(FlickrImage.self, from: jsonData)
            
            // Verify decoded values
            XCTAssertEqual(image.title, "Test Image")
            XCTAssertEqual(image.author, "nobody@flickr.com (John Doe)")
            XCTAssertEqual(image.published, "2023-10-01T12:00:00-08:00")
            XCTAssertEqual(image.media.m, "https://example.com/image.jpg")
            XCTAssertEqual(image.plainDescription, "This is a test image.")
        } catch {
            XCTFail("Failed to decode FlickrImage: \(error)")
        }
    }
}
