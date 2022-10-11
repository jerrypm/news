//
//  ContentView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 21/09/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage(SC.onBoardingKey.value) var isOnboardingViewActive: Bool = true
    
    // MARK: - INIT
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color.purple.ignoresSafeArea()
            if isOnboardingViewActive {
                OnBoardingView()
            } else {
                TabView {
                    HeadLineView()
                        .tabItem {
                            Image.newspaper
                            Text(SC.tabHeadline.value)
                        }
                    SearchView()
                        .tabItem {
                            Image.magnifyingglass
                            Text(SC.tabSearch.value)
                        }
                    SaveNewsView()
                        .tabItem {
                            Image.bookmark
                            Text(SC.tabSave.value)
                        }
                    SettingView()
                        .tabItem {
                            Image.gear
                            Text(SC.tabSetting.value)
                        }
                }
                .accentColor(.coral)
                
            }//: TAB
        } //: ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
