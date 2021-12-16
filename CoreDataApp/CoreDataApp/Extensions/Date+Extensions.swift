//
//  Date+Extensions.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 16/12/2021.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}
