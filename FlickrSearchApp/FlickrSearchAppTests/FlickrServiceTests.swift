//
//  FlickrServiceTests.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

import XCTest
import Combine

@testable import FlickrSearchApp

class FlickrServiceTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testFetchImages() {
        let service = FlickrService.shared
        let expectation = self.expectation(description: "Fetching images")
        
        // Fetch images for a test search term
        service.fetchImages(for: "porcupine")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Failed with error: \(error)")
                }
            }, receiveValue: { images in
                // Verify that images are returned
                XCTAssertFalse(images.isEmpty, "No images returned")
            })
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
