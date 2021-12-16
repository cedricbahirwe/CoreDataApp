//
//  CoreDataManager.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 13/12/2021.
//

import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieAppModel")
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("CoreData Store failed to initilialize, error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save a movie \(error.localizedDescription)")
        }
    }
    
    
    // Get all movies
    func getAllMovies() -> [Movie] {
        
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to get movies : \(error.localizedDescription)")
            return []
        }
    }
    
    // Delete a movie
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        
        do {
            try persistentContainer.viewContext.save()
            print("Movie has been deleted")
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete movie : \(error.localizedDescription)")

        }
    }
    
    func updateMovie() {
        do {
            try persistentContainer.viewContext.save()
            print("Movie has been updated")
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to update movie : \(error.localizedDescription)")

        }
    }
}
