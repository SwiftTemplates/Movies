//
//  MovieTitle.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import SwiftUI

struct MovieTitle: View {
    let movie: Movie
    let offset = CGFloat(-80) // Title: -60
    
    let sublineHint = Color("SublineHint")
    let infoRadius = CGFloat(4)
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(1), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        //ZStack() {
        //    Rectangle()
        //        .fill(gradient)
        VStack {
            
            // Movie Title & Subtitle
            HStack(alignment: .center) {
                Text(movie.title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
            
            HStack(alignment: .center) {
                Text("\(movie.genreText) • \(movie.yearText) • \(movie.durationText)")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            .padding(.bottom, 10)
            
            // Button: Start Playing
            HStack(alignment: .center) {
                
                HStack {
                    Image(systemName: "play.fill")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Start Playing")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                }
                .padding()
                .padding(.horizontal, 10)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.bottom, 10)
            
            
            HStack(alignment: .center) {
                MovieDetailOverview(movie: movie)
            }
            
        }
        //.padding(.top, 40)
        //}
    }
}

struct MovieDetailOverview: View {
    @State var showDescriptionSheetView = false
    
    let movie: Movie
    
    let sublineHint = Color("SublineHint")
    let infoRadius = CGFloat(4)
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                Text("80%")
                    .foregroundColor(sublineHint)
                
                Text("Unrated")
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 4)
                    .cornerRadius(infoRadius)
                    .foregroundColor(sublineHint)
                    .overlay(
                        RoundedRectangle(cornerRadius: infoRadius)
                            .stroke(sublineHint, lineWidth: 2)
                    )
                
                Text("4K")
                    .fontWeight(.heavy)
                    .font(.system(size: 10))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 4)
                    .foregroundColor(.black)
                    .background(sublineHint)
                    .cornerRadius(infoRadius)
                    
                Text("CC")
                    .fontWeight(.bold)
                    .font(.system(size: 10))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 4)
                    .cornerRadius(infoRadius)
                    .foregroundColor(sublineHint)
                    .overlay(
                        RoundedRectangle(cornerRadius: infoRadius)
                            .stroke(sublineHint, lineWidth: 2)
                    )
            }
            .font(.subheadline)
            .padding(.bottom, 2)
            //.padding(.top, -10)
            
            HStack {
                Button(action: {
                    self.showDescriptionSheetView.toggle()
                }) {
                    Text(movie.overview)
                        .truncationMode(.tail)
                        .frame(height: 60)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .frame(minWidth: 0, maxWidth: .infinity) //Device.width-10
                }.sheet(isPresented: $showDescriptionSheetView) {
                    MovieDescriptionSheetView(movie: movie)
                }
                /*
                Text(movie.overview)
                    .truncationMode(.tail)
                    .frame(height: 70)
                */
            }
            .padding(.bottom, 2)
            //.padding()
        }
        .padding()
        .background(Color.black)
        
    }
    
}

struct MovieDescriptionSheetView: View {
    let movie: Movie
    
    var body: some View {
        Text(movie.overview)
            .padding()
    }
}

struct MovieTitle_Previews: PreviewProvider {
    static var previews: some View {
        MovieTitle(movie: Movie.stubbedMovie)
        //.preferredColorScheme(.dark)
        //MovieDetailOverview(movie: Movie.stubbedMovie)
            
    }
}
