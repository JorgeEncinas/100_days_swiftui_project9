//
//  ResetNavPathView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI

struct DetailView2 : View {
    var number : Int
    @Binding var path : [Int]
    // Bindings are common.
    // it's how `TextField`, `Stepper`, and other controls work.
    
    var body : some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...10))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                    // if path was a NavigationPath object, then
                    // path = NavigationPath()
                }
            }
    }
}

struct MainNavView : View {
    @State private var path = [Int]()
    
    var body : some View {
        NavigationStack(path: $path) {
            DetailView2(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView2(number: i, path: $path)
                }
        }
    }
}

#Preview {
    MainNavView()
}
