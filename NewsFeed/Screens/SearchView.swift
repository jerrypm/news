//
//  SearchView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 21/09/22.
//

import SwiftUI

struct SearchView: View {
    // MARK: - PROPERTIES
    @State var searchText: String = .empty
    @StateObject var viewModel = ViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchNews, id: \.title) { article in
                    HStack {
                        HeadLineCellView(
                            imageUrlData: article.urlToImage,
                            textData: article.title,
                            descTextData: article.descriptionValue
                        )
                        
                    }
                    .padding(4)
                    
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText, perform: { newValue in
                viewModel.fetchSearch(keyword: newValue)
            })
            .navigationTitle(SC.tabSearch.value)
            .onAppear {
                viewModel.fetchSearch()
            }
            .overlay(Group {
                if viewModel.topHeadline.isEmpty {
                    ErrorView(errorMessage: viewModel.errorMessage?.localizedDescription)
//                    VStack {
//                        Image.emptyPage
//                            .resizable()
//                            .offset(x: 0, y: -50)
//                            .frame(width: 150, height: 200, alignment: .center)
//                        Text(viewModel.errorMessage?.localizedDescription ?? .empty)
//                            .foregroundColor(.coral)
//                            .multilineTextAlignment(.center)
//                    }
//                    .padding()
                }
            })
        }
        
    }
    
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
