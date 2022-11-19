//
//  ActionSheetCardView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 15/11/22.
//

import SwiftUI

struct BottomSheetView: View {
    @State var show = false
    @State var count = 0
    
    var body : some View{
        
        VStack(spacing: 15){
            
            Toggle(isOn: self.$show) {
                
                Text("Subscribers Count")
            }
            
        }
        .padding(.bottom, 100)
        .padding(.horizontal)
        .padding(.top,20)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(25)
        
    }
    
}

struct ActionSheetCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
