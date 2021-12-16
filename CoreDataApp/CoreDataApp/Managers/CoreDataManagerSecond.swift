//
//  CoreDataManagerSecond.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 14/12/2021.
//

import CoreData

@available(*, deprecated, message: "Use `CoreDataManager` instead.")
class CoreDataManagerSecond {
    lazy var managedObjectModel: NSManagedObjectModel = {
        guard let url = Bundle.main.url(forResource: "ExampleModel", withExtension: "momd") else {
            fatalError("Failed to locate the ExampleModel file.")
        }
        
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load model.")
        }
        
        return model
    }()
    
    // Make sure we're using a specific store DB(SQLite)
    // And we are executing queries of that store
    lazy var coordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let sqlitePath = documentsDirectory.appendingPathComponent("example.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqlitePath, options: nil)
        } catch {
            fatalError("Failed to create coordinator: \(error.localizedDescription)")
        }
        
        return coordinator
    }()
    
    
    lazy var viewContext: NSManagedObjectContext = {
       
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        
        return context
    }()
    
    
    func saveMovie(title: String) {
        let movie = Movie(context: viewContext)
        
        movie.title = title
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to save movie : \(error.localizedDescription)")
        }
    }
}
