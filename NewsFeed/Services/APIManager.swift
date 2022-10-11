//
//  APIManager.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 07/10/22.
//


import Foundation

final class APIManager {
    
    static let share = APIManager()
    
    struct Constants {
        static let baseURLNews = "https://newsapi.org/v2/"
        static let apiKey = "&apiKey=9f7d91151b7d46d4a3be011aa9878deb" // api key 1
//        static let apiKey = "&apiKey=eda6154a62744b7bbad849130a7f7b6f" // api key 2
        
        static let sourcesHeadlineURL = URL(string: baseURLNews + "" + apiKey)
    }
    
    private init() {}
    
    // MARK: Headline A-Z
    public func getAlphabetHeadline(completionL: @escaping (Result<String, Error>) -> Void) {
        guard let url = Constants.sourcesHeadlineURL else {
            return
        }
    }
    
    // MARK: TOP Headline in Country
    public func getTopStories(country: String, completion: @escaping (Result<[Articles], Error>) -> Void) {
        guard let url = URL(string: Constants.baseURLNews + "top-headlines?country=\(country)" + Constants.apiKey) else {
            return
        }
        
        serviceUrlSession(url: url, completion: completion)
    }
    
    
    // MARK: Searching News
    public func getSearchCategoryNews(keyword: String, completion: @escaping (Result<[Articles], Error>) -> Void) {
        guard let url = URL(string: Constants.baseURLNews + "everything?q=\(keyword)" + Constants.apiKey) else {
            return
        }
        
        serviceUrlSession(url: url, completion: completion)
    }
    
    
    // MARK: Hendle Service
    private func serviceUrlSession(url: URL, completion: @escaping (Result<[Articles], Error>) -> Void) {
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
                switch httpResponse.statusCode {
                case 400...499:
                    if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                            if let message = json?["message"] as? String {
                                completion(.failure(message.errorWith()))
                            }
                        } catch {
                            completion(.failure(error))
                        }
                        
                    }
                default:
                    break
                }
            }
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsCountry.self, from: data)
                    guard let articles = result.articles else { return }
                    if articles.isEmpty {
                        completion(.failure(NSError.emptyData))
                    } else {
                        completion(.success(articles))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

