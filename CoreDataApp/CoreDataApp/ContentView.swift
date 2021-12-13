//
//  ContentView.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 13/12/2021.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    
    @State private var movieTitle: String = ""
    
    @State private var movies: [Movie] = []
    var body: some View {
        VStack {
            
            TextField("Enter movie title", text: $movieTitle)
                .textFieldStyle(.roundedBorder)
            
            Button("Save") {
                coreDM.saveMovie(title: movieTitle)
                fetchAllMovies()
            }
            
            List {
                ForEach(movies, id:\.self) { movie in
                    Text(movie.title ?? "No Title")
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        
                        coreDM.deleteMovie(movie: movie)
                        
                        fetchAllMovies()
                    }
                }
            }
        }
        .padding()
        .onAppear {
            fetchAllMovies()
            
        }
    }
    
    func fetchAllMovies() {
        movies = coreDM.getAllMovies()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
