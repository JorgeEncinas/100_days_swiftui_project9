//
//  DataTypesProgrammaticNavigationView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI

struct DifferentNavigationTypesView : View {
    var body : some View {
        NavigationStack {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number: \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select number: \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the Integer \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the String \(selection)")
            }
        }
    }
}

struct ProgrammaticNavigationView2 : View {
    @State private var path = NavigationPath()
    // This is more advanced, since now we'll handle Int OR String,
    // a simple array won't do, given it's constrained to just one type.
    
    var body : some View {
        NavigationStack(path : $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select number \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("Selected integer \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("Selected string \(selection)")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
        }
    }
}

// `NavigationPath` is a "type-eraser"
//  it stores any kind of `Hashable` data
//  without exposing exactly what type of data each item is.

#Preview {
    ProgrammaticNavigationView2()
}
