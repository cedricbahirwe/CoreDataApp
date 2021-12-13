//
//  CoreDataAppApp.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 13/12/2021.
//

import SwiftUI

@main
struct CoreDataAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
