//
//  Extension+NSError.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 09/10/22.
//

import Foundation

extension NSError {
    public static var emptyData: NSError {
        let error = NSError(
            domain: .empty,
            code: 204,
            userInfo: [ NSLocalizedDescriptionKey: "This country data not available"])
        return error
    }
    
}
