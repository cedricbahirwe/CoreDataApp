//
//  MovieDetail.swift
//  CoreDataApp
//
//  Created by Cédric Bahirwe on 14/12/2021.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    
    let coreDM: CoreDataManager
    
    @State private var movieName = ""
    var body: some View {
        VStack {
            TextField(movie.title ?? "Enter movie name", text: $movieName)
                .textFieldStyle(.roundedBorder)
            
            Button("Update") {
                guard !movieName.isEmpty else { return }
                movie.title = movieName
                coreDM.updateMovie()
            }

        }
        .padding()
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        let coreDM = CoreDataManager()
        let movie = Movie(context: coreDM.persistentContainer.viewContext)
        
        MovieDetail(movie: movie, coreDM: coreDM)
    }
}
