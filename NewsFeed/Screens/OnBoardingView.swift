//
//  OnBoardingView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 21/09/22.
//

import SwiftUI

struct OnBoardingView: View {
    // MARK: - PROPERTIES
    @AppStorage(SC.onBoardingKey.value) var isOnboardingViewActive: Bool = true
    
    //MARK: - INIT
    init() {
        print("First")
    }
    
    // MARK: - BODY
    
    var body: some View {
        #warning("Need update here")
        ZStack {
            Text("OnBoarding")
            
        }
        .onAppear {
            print("Second")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isOnboardingViewActive = false
            })
        }
        
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
