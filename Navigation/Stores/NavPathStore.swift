//
//  NavPathStore.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/15/25.
//
import SwiftUI

@Observable
class NavigationPathStore {
    var navPath : NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data
            ) {
                navPath = NavigationPath(decoded)
                return
            }
        }
        
        // if loading fails
        navPath = NavigationPath()
    }
    
    func save() {
        guard let representation = navPath.codable else {
            return
        }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            
        }
    }
}
