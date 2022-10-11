//
//  HeadLineView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 21/09/22.
//

import SwiftUI

struct HeadLineView: View {
    // MARK: - PROPERTIES
    @StateObject var viewModel = ViewModel()
    @State var presentingModal = false
    @State var countryID: CountryListType = .us
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.topHeadline, id: \.title) { article in
                    HStack {
                        HeadLineCellView(
                            imageUrlData: article.urlToImage,
                            textData: article.title,
                            descTextData: article.descriptionValue
                        )
                    }
                    .padding(4)
                }
                
            } //: LIST
            .navigationTitle(SC.tabHeadline.value)
            .toolbar {
                Button {
                    self.presentingModal = true
                } label: {
                    Image.flag
                }
                .fullScreenCover(isPresented: $presentingModal, content: {
                    CountriesView(presentedAsModal: self.$presentingModal, countryID: self.$countryID) { model in
                        //: reload update data or change data
                        viewModel.fetchHeadline(country: model)
                    }
                })

            }
            .overlay(Group {
                if viewModel.topHeadline.isEmpty {
                    VStack {
                        Image.emptyPage
                            .resizable()
                            .offset(x: 0, y: -50)
                            .frame(width: 150, height: 200, alignment: .center)
                        Text(viewModel.errorMessage?.localizedDescription ?? .empty)
                            .foregroundColor(.coral)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            })
            .onAppear { //: Get Data on this page
                viewModel.fetchHeadline(country: countryID)
            }
            .refreshable { //: pull refresh
                viewModel.fetchHeadline(country: countryID)
            }
        }
        
    }
}

struct HeadLineView_Previews: PreviewProvider {
    static var previews: some View {
        let extractedExpr = HeadLineView()
        extractedExpr
    }
}
