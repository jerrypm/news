//
//  String+Constant.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 21/09/22.
//

import Foundation

typealias SC = StringConstant

enum StringConstant: String {
    //MARK: - Empty
    case empty = ""
    case dash = "-"
    case space = "   "
    
    //MARK: - Title & Description
    case tabHeadline = "Headline"
    case tabSearch = "Search"
    case tabSave = "Save"
    case tabSetting = "Setting"
    
    case countries = "Countries"
    
    //MARK: - Image named
    case emptyLight = "emptyLight"
    
    //MARK: - Image System Name
    case newspaper = "newspaper"
    case magnifyingglass = "magnifyingglass"
    case bookmark = "bookmark"
    case gear = "gearshape"
    case flag = "flag.circle"
    case close = "xmark.circle"
    
    //MARK: - Colors String
    case jade = "Jade"
    case malibu = "Malibu"
    case coral = "LightCoral"

    
    //MARK: - Keys
    case onBoardingKey = "onBoarding"
    
    var value: String {
        return rawValue
    }
    
}


