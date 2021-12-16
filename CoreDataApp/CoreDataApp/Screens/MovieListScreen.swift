//
//  MovieListScreen.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 16/12/2021.
//

import SwiftUI

struct MovieListScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            
            Text("Movies")
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            
        },  content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        .onAppear(perform: {
            
        })
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}

struct MovieCell: View {
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("movie.title")
                    .fontWeight(.bold)
                Text("movie.director")
                    .font(.caption2)
                Text("movie.releaseDate ?? ")
                    .font(.caption)
            }
            Spacer()
            RatingView(rating: .constant(2))
        }
    }
}
