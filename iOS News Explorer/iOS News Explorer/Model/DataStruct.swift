//
//  DataStruct.swift
//  iOS News Explorer
//
//  Created by Саша Боднар on 13.10.2023.
//

struct AppleDataResponse: Codable {
    var articles: [AppleArticles]
}

struct AppleArticles: Identifiable, Codable {
    var id: String { title }
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let id: String?
    let name: String?
}
