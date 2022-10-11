//
//  HeadLineCellView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 29/09/22.
//

import SwiftUI

struct HeadLineCellView: View {
    // MARK: - PROPERTIES
    
    @State var imageUrlData: String?
    @State var textData: String?
    @State var descTextData: String?
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            //: Image
            AsyncImage(url: URL(string: imageUrlData ?? .empty)) { image in
                image.resizable()
            } placeholder: {
                Image.newspaper
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            
            //: Text
            VStack(alignment: .leading, spacing: 8) {
                Text(textData ?? .dash)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                
                Text(descTextData ?? .dash)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            } //: VSTACK
        } //: HSTACK
    }
}

struct HeadLineCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        HeadLineCellView()
    }
}
