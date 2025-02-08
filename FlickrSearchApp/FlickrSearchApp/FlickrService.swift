//
//  FlickrService.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

// MARK: - Network Layer

import Foundation
import Combine

class FlickrService {
    static let shared = FlickrService()
    
    private init() {}
    
    func fetchImages(for tags: String) -> AnyPublisher<[FlickrImage], Error> {
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(tags)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FlickrResponse.self, decoder: JSONDecoder())
            .map(\.items)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
