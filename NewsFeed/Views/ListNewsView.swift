//
//  ListNewsView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 15/11/22.
//

import SwiftUI

struct ListNewsView: View {
    // MARK: - PROPERTIES
    @State var textData: String?
    @State var descTextData: String?
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
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

struct ListNewsView_Previews: PreviewProvider {
    static var previews: some View {
        ListNewsView()
    }
}
