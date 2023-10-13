//
//  NewsView.swift
//  iOS News Explorer
//
//  Created by Саша Боднар on 13.10.2023.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var newsModel: NewsViewModel
    @Binding var searchText: String
    @Binding var filtering: NewsViewModel.filterType
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    FiltersButtonModel(filtering: $newsModel.filtering)
                    VStack(alignment: .leading) {
                        ForEach(newsModel.searchResults) { array in
                            NavigationLink(
                                destination: DetailView(filteredTitle: array.title)) {
                                    VStack(alignment: .leading) {
                                        Text("\(array.title)")
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(2)
                                        Spacer()
                                        Text("\(array.description ?? "")")
                                            .font(.subheadline)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(3)
                                    }
                                    Spacer()
                                }
                        }
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 340, alignment: .leading)
                        .background(Color(hue: 0.745, saturation: 0.961, brightness: 0.634))
                        .cornerRadius(10)
                        .foregroundColor(Color(hue: 0.777, saturation: 1.0, brightness: 0.151))
                    }
                    .onAppear {
                        newsModel.getData()
                    }
                }
                .foregroundColor(.white)
            }
        }
        .searchable(text: $newsModel.searchText, prompt: "Search (ex. 'words' or 2023-06-13)")
        .foregroundColor(.white)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(searchText: .constant(""), filtering: .constant(.none))
            .environmentObject(NewsViewModel())
    }
}
