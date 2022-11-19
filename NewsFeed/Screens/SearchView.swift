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
    @State var showactionSheet: Bool = false
    @State var urlString: String = .empty
    @StateObject var viewModel = ViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.searchNews, id: \.title) { article in
                    HStack {
                        if article.source?.name == nil {
                            ListNewsView(
                                textData: article.title,
                                descTextData: article.descriptionValue
                            )
                        } else {
                            HeadLineCellView(
                                imageUrlData: article.urlToImage,
                                textData: article.title,
                                descTextData: article.descriptionValue
                            )
                        }
                        
                    }
                    .padding(4)
                    .onTapGesture {
                        showactionSheet.toggle()
                        urlString = article.url ?? .empty
                    }
                    .actionSheet(isPresented: $showactionSheet) {
                        ActionSheet(
                            title: Text(SC.titleOpenWeb.value),
                            buttons: [
                                .default(Text(SC.openWeb.value), action: {
                                    viewModel.openUrlWeb(urlString: urlString)
                                }),
                                .cancel()
                                
                            ]
                        )
                    }
                    
                }
            }
            .navigationTitle(SC.tabSearch.value)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .onChange(of: searchText, perform: { newValue in
                viewModel.fetchSearch(keyword: newValue)
            })
            .onAppear {
                viewModel.fetchListNews()
            }
            .overlay(Group {
                if viewModel.searchNews.isEmpty {
                    VStack(spacing: 16) {
                        ErrorViewImage()
                        Text(SC.errorTitle.value)
                            .foregroundColor(.textPrimary)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .bold))
                        Text(viewModel.errorMessage?.localizedDescription ?? .empty)
                            .foregroundColor(.coral)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
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
