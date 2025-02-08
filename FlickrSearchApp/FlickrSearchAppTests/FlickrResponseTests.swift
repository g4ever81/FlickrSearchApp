//
//  FlickrResponseTests.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

import XCTest
import Combine

@testable import FlickrSearchApp

class FlickrResponseTests: XCTestCase {
    func testFlickrResponseDecoding() {
        // Sample JSON data for a Flickr response
        let json = """
        {
            "items": [
                {
                    "title": "Test Image 1",
                    "author": "nobody@flickr.com (John Doe)",
                    "date_taken": "2023-10-01T12:00:00-08:00",
                    "description": "This is a <b>test</b> image.",
                    "media": {
                        "m": "https://example.com/image1.jpg"
                    }
                },
                {
                    "title": "Test Image 2",
                    "author": "nobody@flickr.com (Jane Doe)",
                    "date_taken": "2023-10-02T12:00:00-08:00",
                    "description": "This is another <b>test</b> image.",
                    "media": {
                        "m": "https://example.com/image2.jpg"
                    }
                }
            ]
        }
        """
        
        // Convert JSON to Data
        guard let jsonData = json.data(using: .utf8) else {
            XCTFail("Failed to convert JSON to Data")
            return
        }
        
        // Decode JSON into FlickrResponse
        do {
            let response = try JSONDecoder().decode(FlickrResponse.self, from: jsonData)
            
            // Verify decoded values
            XCTAssertEqual(response.items.count, 2)
            XCTAssertEqual(response.items[0].title, "Test Image 1")
            XCTAssertEqual(response.items[1].title, "Test Image 2")
            XCTAssertEqual(response.items[0].media.m, "https://example.com/image1.jpg")
            XCTAssertEqual(response.items[1].media.m, "https://example.com/image2.jpg")
        } catch {
            XCTFail("Failed to decode FlickrResponse: \(error)")
        }
    }
}
