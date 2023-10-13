//
//  DetailView.swift
//  iOS News Explorer
//
//  Created by Саша Боднар on 13.10.2023.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var modelNews: NewsViewModel
    var filteredTitle: String
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(modelNews.arrayData.filter({ filtered in
                            return filtered.title == filteredTitle})) { array in
                                VStack(alignment: .leading) {
                                    Text(array.title)
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: array.urlToImage ?? "")) { Image in
                                            Image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .scaledToFit()
                                                .cornerRadius(5.0)
                                        }
                                    placeholder: {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .frame(width: 190, height: 150)
                                            .scaledToFit()
                                        .foregroundColor(Color.blue)}
                                    }
                                    VStack(alignment: .leading) {
                                        Text(array.description ?? "")
                                            .font(.headline)
                                        Spacer()
                                        HStack{
                                            Text(array.author ?? "no author")
                                                .font(.title3)
                                                .fontWeight(.medium)
                                                .foregroundColor(Color(hue: 1.0, saturation: 0.005, brightness: 0.666))
                                            Spacer()
                                        }
                                        Spacer()
                                        HStack{
                                            Text(array.source.name ?? "")
                                            Spacer()
                                            VStack{
                                                Text(array.publishedAt)
                                            }
                                        }
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.005, brightness: 0.666))
                                    }
                                    .foregroundColor(Color.white)
                                    Spacer()
                                }
                                .padding()
                                .frame(width: 340, alignment: .leading)
                                .background(Color(hue: 0.745, saturation: 0.961, brightness: 0.634))
                                .cornerRadius(10)
                                .foregroundColor(Color(hue: 0.777, saturation: 1.0, brightness: 0.151))
                                .padding(.vertical, 100.0)
                            }
                    }
                }
                .padding(.vertical)
                .onAppear {
                    modelNews.getData()
                }
            }
            .ignoresSafeArea(edges: [.top])
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( filteredTitle: "")
            .environmentObject(NewsViewModel())
    }
}
