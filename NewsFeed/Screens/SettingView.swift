//
//  SettingView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 07/10/22.
//

import SwiftUI

struct SettingView: View {
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Text("setting")
        }
        .navigationTitle(SC.tabSetting.value)
        .toolbar {
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
