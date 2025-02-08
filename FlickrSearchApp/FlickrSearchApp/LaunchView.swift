//
//  LaunchView.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isLaunching = true
    
    var body: some View {
        Group {
            if isLaunching {
                LaunchView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isLaunching = false
                            }
                        }
                    }
            } else {
                SearchView()
            }
        }
    }
}

struct LaunchView: View {
    var body: some View {
        VStack {
            Image("LaunchImage")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Text("Welcome to Flickr Search")
                .font(.headline)
                .padding()
        }
    }
}
