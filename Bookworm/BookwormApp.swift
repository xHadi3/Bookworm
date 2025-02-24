//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Hadi Al zayer on 12/08/1446 AH.
//

import SwiftData
import SwiftUI


@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
    
}
