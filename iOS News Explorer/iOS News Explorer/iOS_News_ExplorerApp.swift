//
//  iOS_News_ExplorerApp.swift
//  iOS News Explorer
//
//  Created by Саша Боднар on 13.10.2023.
//

import SwiftUI

@main
struct iOS_News_ExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
//            NewsView(searchText: .constant(""), filtering: .constant(.none))
//                .environmentObject(NewsViewModel())
        }
    }
}
