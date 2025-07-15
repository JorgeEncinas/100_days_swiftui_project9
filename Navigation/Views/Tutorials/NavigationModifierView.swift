//
//  NavigationModifierView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI

// Now instead we separate destination from value
// so that the destination is only loaded when needed.

// 2 STEPS
//      1. Attach a value to the NavigationLink.
//          a string, integer, custom struct instance
//          The REQUIREMENT is that it must conform to a protocol
//          called `Hashable`
//          (most of Swift's built-in types already conform to `Hashable`.
//              Int, String, Date, URL, arrays, dictionaries)

//      2. Attaching a `navigationDestination()` modifier inside the
//          navigation stack, telling it what to do when it receives your data

// CHAINING NAVIGATION MODIFIERS
//  You can do that, so that the TYPE changes what you can do
//      when receiving an INT do this, but when it's a STRING do THAT.

// COMPLEX DATA - CUSTOM STRUCTS
//  Here `hashing` comes into the picture.
//  You convert the data into a smaller representation in a consistent way
//      commonly used when DOWNLOADING data
//  Imagine downloading a movie on your Apple TV.
//      it might be 10GB
//  Hashes convert it into a short string, maybe 40 characters in total.
//      it is a consistent hash, so that if we compare your hash download,
//      to the hash in the server, they should always be the same
//      and so you can know if you correctly downloaded the file.

//  We can't UNHASH data.
//  Swift uses `Hashable` a lot internally.
//      when you use a `Set` rather than `Array`, everything in there must
//      conform to `Hashable`, which is what makes the Set faster.
//      to know if an element is there, Swift computes the hash of your object,
//      then searches for it in the set.

struct SimpleNavigationView2 : View {
    var body : some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                // When asked to navigate to an Integer...
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    SimpleNavigationView2()
}
