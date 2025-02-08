//
//  SearchBar.swift
//  FlickrSearchApp
//
//  Created by Gaurav Mehta on 2/8/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onCommit: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search", text: $text, onCommit: onCommit)
                .accessibilityIdentifier("Search")
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}
