//
//  PathStore.swift
//  Navigation
//
//  Created by Jorge Encinas on 7/14/25.
//
import SwiftUI //Just in case
import Observation // I think this one's also not necessary, but you can Jump to Definition on the @Observable keyword itself

@Observable
class PathStore {
    var path : [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        // If nothing to decode, or decode failed, then just start it empty
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save Navigation Data.")
        }
    }
}

