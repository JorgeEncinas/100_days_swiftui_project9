//
//  PathStoreNavView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

// Codable Navigation stack path
//      1. If you're using `NavigationPath`
//          SwiftUI provides 2 helpers to make saving/loading easier
//
//      2. If you're using a homogeneous array, e.g. [Int] or [String]
//          then you don't need those helpers, and you can load or save your data freely

struct DetailView3 : View {
    var number : Int
    // Notice we don't have a `path` here now.
    
    var body : some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...10))
            .navigationTitle("Number \(number)")
    }
}

struct PathStoreView : View {
    @State private var pathStore = PathStore()
    
    var body : some View {
        NavigationStack(path: $pathStore.path) {
            DetailView3(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView3(number: i)
                }
        }
    }
}

#Preview {
    PathStoreView()
}
