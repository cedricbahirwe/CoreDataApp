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
    @State private var needsRefresh: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies, id:\.self) { movie in
                    NavigationLink(destination: {
                        MovieDetail(movie: movie, coreDM: coreDM, needsRefresh: $needsRefresh)
                    }) {
                        Text(movie.title ?? "No Title")
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        
                        coreDM.deleteMovie(movie: movie)
                        
                        fetchAllMovies()
                    }
                }

            }
            .navigationBarTitle("Movies")
            .safeAreaInset(edge: .bottom) {
                VStack {
                    TextField("Enter movie title", text: $movieTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save") {
                        guard !movieTitle.isEmpty else { return }
                        coreDM.saveMovie(title: movieTitle)
                        fetchAllMovies()
                    }
                }
                .padding()
                .background(needsRefresh ? .thickMaterial : .regularMaterial)
                
            }
            .onAppear {
                fetchAllMovies()
                
            }
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
