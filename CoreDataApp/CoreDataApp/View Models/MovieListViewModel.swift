//
//  MovieListViewModel.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 16/12/2021.
//

import Foundation
import CoreData

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    public func getAllMovies() {
        let movies = CoreDataManager.shared.getAllMovies()
        
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
    
    public func deleteMovie(movie: MovieViewModel) {
        let movie = CoreDataManager.shared.getMoview(by: movie.id)
        
        if let movie = movie {
            CoreDataManager.shared.deleteMovie(movie: movie)
        }
    }
}


struct MovieViewModel {
    let movie: Movie
    
    var id: NSManagedObjectID { movie.objectID }
    
    var title: String { movie.title ?? "" }
    
    var director: String { movie.director ?? "" }
    
    var releaseDate: String? { movie.releaseDate?.asFormattedString() }
    
    var rating: Int { Int(movie.rating) }
}
