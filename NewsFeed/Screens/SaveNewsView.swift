//
//  SaveNewsView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 21/09/22.
//

import SwiftUI

struct SaveNewsView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                Text("text news")
            }
            .navigationTitle(SC.tabSave.value)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SaveNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNewsView()
    }
}
