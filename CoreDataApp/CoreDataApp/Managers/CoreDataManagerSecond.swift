//
//  CoreDataManagerSecond.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 14/12/2021.
//

import CoreData

class CoreDataManagerSecond {
    lazy var managedObject: NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: "ExampleModel", withExtension: "momd") else {
            fatalError("Failed to locate the ExampleModel file.")
        }
        
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load model.")
        }
        
        return model
    }()
}
