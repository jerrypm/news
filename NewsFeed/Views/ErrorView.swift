//
//  ErrorView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 09/10/22.
//

import SwiftUI

struct ErrorView: View {
    // MARK: - PROPERTIES
    @State var errorMessage: String?
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Image.emptyPage
                .resizable()
                .offset(x: 0, y: -40)
                .frame(width: 150, height: 200, alignment: .center)
            Text(errorMessage ?? .empty)
                .foregroundColor(.coral)
                .multilineTextAlignment(.center)
        }
        .onChange(of: errorMessage, perform: { newValue in
            print(newValue)
        })
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
