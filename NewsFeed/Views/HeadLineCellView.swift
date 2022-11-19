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
        HStack(alignment: .top, spacing: 16) {
            //: Image
            AsyncImage(url: URL(string: imageUrlData ?? .empty)) { image in
                image.resizable()
            } placeholder: {
                Image.newspaper
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .scaledToFill()
            .frame(width: 100, height: 150)
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            
            //: Text
            VStack(alignment: .leading, spacing: 8) {
                Text(textData ?? .dash)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity)
                
                Text(descTextData ?? .dash)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                
            } //: VSTACK
        } //: HSTACK
        .padding()
        .background(Color.backgroundDefault)
        .clipped()
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 2, x: 0, y: 2)
    }
}

struct HeadLineCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeadLineCellView()
    }
}

struct TopHeadLineCellView: View {
    // MARK: - PROPERTIES
    @State var imageUrlData: String?
    @State private var centerRect: CGRect = .zero
    @State var frame: CGSize = .zero
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            //: Image
            AsyncImage(url: URL(string: imageUrlData ?? .empty)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
            } placeholder: {
                Image.newspaper
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .position(x: 150, y: 100)
                    .opacity(0.2)
            }
            
        } //: ZSTACK
        .padding()
        .background(Color.backgroundDefault)
        .clipped()
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 4, x: 0, y: 0)
    }
    
}
