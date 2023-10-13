//
//  FiltersButtonModel.swift
//  iOS News Explorer
//
//  Created by Саша Боднар on 13.10.2023.
//

import SwiftUI

struct FiltersButtonModel: View {
    @EnvironmentObject var model: NewsViewModel
    @Binding var filtering: NewsViewModel.filterType
    
    var body: some View {
        HStack {
            Spacer()
            Button("ALL", action: {model.filtering = .none})
            Spacer()
            Button("AUTHOR", action: {model.filtering = .author})
            Spacer()
            Button("PUBLISHEDAT", action: {model.filtering = .publishedAt})
            Spacer()
            Button("TITLE", action: {model.filtering = .title})
            Spacer()
        }
        .foregroundColor(.white)
        .font(.body)
        .padding()
    }
}
