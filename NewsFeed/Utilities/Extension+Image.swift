//
//  Extension+Image.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 27/09/22.
//

import SwiftUI

extension Image {
    // MARK: System
    public static var newspaper: Image {
        return Image(systemName: SC.newspaper.value)
    }
    
    public static var magnifyingglass: Image {
        return Image(systemName: SC.magnifyingglass.value)
    }
    
    public static var bookmark: Image {
        return Image(systemName: SC.bookmark.value)
    }
    
    public static var gear: Image {
        return Image(systemName: SC.gear.value)
    }
    
    public static var flag: Image {
        return Image(systemName: SC.flag.value)
    }
    
    public static var close: Image {
        return Image(systemName: SC.close.value)
    }
    
    // MARK: Asset
    public static var emptyPage: Image {
        return Image(uiImage: UIImage(named: SC.emptyImage.value)!)
    }
}
