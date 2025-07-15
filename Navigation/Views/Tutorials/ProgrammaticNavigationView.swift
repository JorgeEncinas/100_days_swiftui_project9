//
//  ProgrammaticNavigationView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI

struct ProgrammaticNavigationView : View {
    @State private var path = [Int]()
    
    var body : some View {
        NavigationStack(path: $path) { //changing the array, will auto-navigate to
            // whatever is in the array,
            // but ALSO changes the array as the user presses `Back`
            // in the Navigation Bar.
            VStack {
                Button("Show 32") {
                    path = [32] //Returns NavigationStack to its original state
                    // before navigating to the number 32
                }
                Button("Show 64") {
                    path.append(64) // This one, instead, adds 64 to the array
                    // so it adds to wherever we are.
                }
                Button("Show 32 then 64") { //Push multiple values at the same time
                    path = [32, 64]
                    // Behavior is kind of like a Stack
                    // in that whatever is at the end is shown first.
                    
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationView()
}
