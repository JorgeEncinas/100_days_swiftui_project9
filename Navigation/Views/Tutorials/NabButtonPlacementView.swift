//
//  NabButtonPlacementView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

struct PlaceButtonsInToolbarView : View {
    var body : some View {
        NavigationStack {
            Text("Hello World")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me!") {
                            
                        }
                    }
                }
        }
    }
}

//Placements with SPECIFIC MEANINGS, more than relying on LOCATION
//  .confirmationAction
//      You want users to agree to something,
//      such as agreeing to terms of service.
//  .destructiveAction
//      If user needs to make a choice to destroy something, such as
//      confirming if they want to remove some data they created
//  .cancellationAction
//      User needs to back out of changes they have made
//      such as discarding changes they have made
//  .navigation
//      For buttons that make the user move between data
//      such as going Back & Forth in a web browser.

struct PlaceButtonsView2 : View {
    
    var body : some View {
        NavigationStack {
            Text("Add toolbar to me")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Button 1") {
                            
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Button 2") {
                            
                        }
                    }
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Button 3") {
                            
                        }
                        Button("Button 4") {
                            
                        }
                    }
                }
                //.navigationBarBackButtonHidden(true)
                // use this one so users can't NOT decide on something
                // if that's something you desire.
        }
    }
}

#Preview {
    PlaceButtonsInToolbarView()
    PlaceButtonsView2()
}
