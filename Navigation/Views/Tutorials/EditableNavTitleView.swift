//
//  EditableNavTitleView.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI


struct EditableNavTitleView : View {
    @State private var title : String = "SwiftUI"
    var body : some View {
        NavigationStack {
            Text("Something")
                .navigationTitle($title) //No need for an extra textfield
                .navigationBarTitleDisplayMode(.inline) //THEN you can pass a binding
        }
    }
}

#Preview {
    EditableNavTitleView()
}

