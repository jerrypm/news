//
//  Extension+String.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 09/10/22.
//

import Foundation

extension String {
    
    public static var empty: String {
        return SC.empty.value
    }
    
    public static var dash: String {
        return SC.dash.value
    }
    
    public static var threeSpace: String {
        return SC.space.value
    }
    
    //: Error response convert
    
    public func errorWith() -> NSError {
        let error = NSError(
            domain: .empty,
            code: 429,
            userInfo: [NSLocalizedDescriptionKey: self])
        return error
    }
    

}
