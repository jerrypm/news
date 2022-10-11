//
//  ViewModel.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 06/10/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var topHeadline: [Articles] = []
    @Published var searchNews: [Articles] = []
    @Published var errorMessage: Swift.Error?
    
    // MARK: TOP Headline
    func fetchHeadline(country: CountryListType) {
        APIManager.share.getTopStories(country: country.rawValue) {[weak self] result in
            DispatchQueue.main.async {
                self?.topHeadline.removeAll()
                switch result {
                case .success(let articles):
                    articles.forEach { article in
                        self?.topHeadline.append(article)
                    }
                case .failure(let error):
                    self?.errorMessage = error
                }
            }
            
        }
    }
    
    // MARK: Search
    func fetchSearch(keyword: String? = nil) {
        APIManager.share.getSearchCategoryNews(keyword: keyword ?? "") { [weak self] result in
            DispatchQueue.main.async {
                self?.searchNews.removeAll()
                switch result {
                case .success(let articles):
                    articles.forEach { article in
                        self?.searchNews.append(article)
                    }
                case .failure(let error):
                    self?.errorMessage = error
                }
            }
        }
    }
}
