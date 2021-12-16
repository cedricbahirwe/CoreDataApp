//
//  View+Extensions.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 16/12/2021.
//

import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
