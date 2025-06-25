//
//  pencilTestApp.swift
//  pencilTest
//
//  Created by POS on 6/25/25.
//

import SwiftUI
import SwiftData

@main
struct pencilTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Archive.self)
    }
}
