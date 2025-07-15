//
//  InefficientNavView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI

struct DetailView : View {
    var number : Int
    
    var body : some View {
        Text("Detail View \(number)")
    }
    
    init(number : Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct SimpleNavigationView : View {
    var body : some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                //Text("Detail View")
                DetailView(number: 556)
                //Just showing the navigation on the screen
                // is enough for SwiftUI to automatically
                // create a Detail View instance!
                // So if we had 1000 rows, you will see that all instances are created as you scroll, often MORE THAN ONCE!!!!!
                
                // So there's a better solution: attaching a PRESENTATION VALUE
                // to our Navigation Link
            }
            List(0..<100) { i in
                NavigationLink("Tap Me") { //As you scroll up and down, the detail views are being created again and again. That can't be good.
                    DetailView(number: i)
                }
            }
        }
    }
}

