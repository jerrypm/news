//
//  ViewModel.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 06/10/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var firstTopHeadline: Articles?
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
                    for(key, article) in articles.enumerated() {
                        if key == 0 {
                            self?.firstTopHeadline = article
                        }
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
                case .failure(_):
                    self?.fetchListNews()
                }
            }
        }
    }
    
    // MARK: Alphabet data
    func fetchListNews() {
        APIManager.share.getListNews { [weak self] result in
            DispatchQueue.main.async {
                self?.searchNews.removeAll()
                switch result {
                case .success(let source):
                    source.forEach { sourceData in
                        let article = Articles(
                            title: sourceData.id,
                            publishedAt: sourceData.name,
                            descriptionValue: sourceData.descriptionValue,
                            url: sourceData.url
                        )
                        self?.searchNews.append(article)
                    }
                case .failure(let error):
                    self?.errorMessage = error
                }
                
            }
        }
        
    }
    
    func openUrlWeb(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
