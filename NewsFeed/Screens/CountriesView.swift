//
//  CountriesView.swift
//  NewsFeed
//
//  Created by Jeri Purnama on 07/10/22.
//

import SwiftUI

struct CountriesView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @Binding var presentedAsModal: Bool
    @Binding var countryID: CountryListType
    
    var onDismiss: ((_ model: CountryListType) -> Void)?
    var listOfCountry = CountryListType.all
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(listOfCountry, id: \.self) { country in
                    HStack {
                        Text(country.flag + .threeSpace + country.country)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.trailing, 8)
                        
                    }
                    .onTapGesture {
                        onDismiss?(country)
                        countryID = country
                        presentedAsModal = false
                    }
                    
                }
            } //: List
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image.close
                        .foregroundColor(.coral)
                    
                }
                
            } //: Toolbar
            .navigationTitle(SC.countries.value)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(presentedAsModal: .constant(false), countryID: .constant(.us))
    }
}
