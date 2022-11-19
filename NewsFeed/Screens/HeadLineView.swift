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
                LazyVStack {
                    ForEach(viewModel.topHeadline, id: \.title) { article in
                        if article.title == viewModel.firstTopHeadline?.title {
                            TopHeadLineCellView(imageUrlData: viewModel.firstTopHeadline?.urlToImage)
                                .frame(maxWidth: .infinity)
                        } else {
                            HeadLineCellView(
                                imageUrlData: article.urlToImage,
                                textData: article.title,
                                descTextData: article.descriptionValue
                            )
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                        }
                        
                    }
                }
                .listRowSeparator(.hidden)
                
            } //: LIST
            .navigationTitle(SC.tabHeadline.value)
            .navigationBarTitleDisplayMode(.inline)
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
                
            } //: Tool Bar
            .overlay(Group {
                if viewModel.topHeadline.isEmpty {
                    VStack(spacing: 16) {
                        ErrorViewImage()
                        Text(SC.errorTitle.value)
                            .foregroundColor(.textPrimary)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 24, weight: .bold))
                        Text(viewModel.errorMessage?.localizedDescription ?? .empty)
                            .foregroundColor(.coral)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                }
            }) //: Overlay
            .onAppear { //: Get Data on this page
                viewModel.fetchHeadline(country: countryID)
            } //: On Appear
            .refreshable { //: pull refresh
                viewModel.fetchHeadline(country: countryID)
            } //: Refresh / Reload
            .listStyle(PlainListStyle()) //:
//            .background(Color(UIColor.gray).ignoresSafeArea())
        }
        
    }
}

struct HeadLineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadLineView()
    }
}
