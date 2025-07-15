//
//  StyledNavigationView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct StyledNavigationView : View {
    var body : some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar) //added `for` bc otherwise it affects other kinds of toolbars!
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar(.hidden, for: .navigationBar) //Note how information goes past the edge into where the clock and the battery are displayed.
        }
    }
}

#Preview {
    StyledNavigationView()
}
