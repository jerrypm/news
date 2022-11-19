//
//  SettingView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 07/10/22.
//

import SwiftUI

struct SettingView: View {
    // MARK: - PROPERTIES
    @AppStorage(SC.isDarkMode.value) private var isDarkMode = true
    @AppStorage(SC.darkModetext.value) private var modeType: String = SC.darkMode.value
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(SC.apperaance.value)) {
                    Toggle(modeType, isOn: $isDarkMode)
                        .onChange(of: isDarkMode) { newValue in
                            self.modeType = newValue ? SC.darkMode.value : SC.lightMode.value
                        }
                    
                }
                Section(header: Text(SC.info.value)) {
                    Text(SC.email.value)
                    Text(SC.website.value)
                    Text(SC.version.value)
                }
            }
            .background(Color.white)
            .navigationTitle(SC.tabSetting.value)
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
