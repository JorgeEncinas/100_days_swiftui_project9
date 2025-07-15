//
//  Student.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI

// CONFORMING TO `Hashable`
struct Student : Hashable { //Seems like it didn't require anything else, really.
    var id = UUID()
    var name : String
    var age : Int
}
