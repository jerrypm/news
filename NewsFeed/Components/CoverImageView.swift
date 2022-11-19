//
//  CoverImageView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 12/10/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    @State var imageUrlData: String?
    
    // MARK: - BODY
    var body: some View {
        AsyncImage(url: URL(string: imageUrlData ?? .empty)) { image in
            image.resizable()
        } placeholder: {
            Image.newspaper
                .resizable()
                .frame(width: 50, height: 50)
        }
        
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
