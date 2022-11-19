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
    case darkMode = "Dark Mode"
    case lightMode = "Light Mode"
    case version = "Version 1.0.0"
    case titleOpenWeb = "Open in safari"
    case openWeb = "Open web"
    
    case errorTitle = "Something when wrong"
    case apperaance = "Apperaance"
    case info = "Info"
    case email = "Email"
    case website = "Website"
    
    //MARK: - Image named
    case emptyImage = "emptyImage"
    
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
    case backgroundDefault = "Background Default"
    case textPrimary = "Text Primary"
    
    //MARK: - Keys
    case onBoardingKey = "onBoarding"
    case isDarkMode = "isDarkMode"
    case darkModetext = "darkModetext"
    
    var value: String {
        return rawValue
    }
    
}


