//
//  Movie.swift
//  Movies
//
//  Created by Justin Bush on 2021-06-26.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable, Hashable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    
    let genres: [MovieGenre]?
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
        //return URL(string: "https://image.tmdb.org/t/p/w780\(backdropPath ?? "")")!
    }
    
    var backdropHDURL: URL {
        print("Fetch: " + "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")
        return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
    }
    
    var coverSmall: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    var coverMedium: URL {
        return URL(string: "https://image.tmdb.org/t/p/w780\(backdropPath ?? "")")!
    }
    var coverLarge: URL {
        print("Fetch: " + "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")
        return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
    }
    var posterSmall: URL {
        return URL(string: "https://image.tmdb.org/t/p/w342\(posterPath ?? "")")!
    }
    var posterMedium: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    var posterLarge: URL {
        return URL(string: "https://image.tmdb.org/t/p/original\(posterPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var posterHDURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/original\(posterPath ?? "")")!
    }
    
    
    /*
    enum Poster {
        case w92
        case w154
        case w185
        case w342
        case w500
        case w780
        case original
        
        var url: URL {
            var urlString = "https://image.tmdb.org/t/p/"
            switch self {
            case .w92:  urlString += "w92"
            case .w154: urlString += "w154"
            case .w185: urlString += "w185"
            case .w342: urlString += "w342"
            case .w500: urlString += "w500"
            case .w780: urlString += "w780"
            case .original: urlString += "original"
            }
            urlString += "/\(Movie.posterPath ?? "")"
            return URL(string: <#T##String#>)
        }
    }
    */
    
    enum ImageSize {
        case tiny
        case small
        case thumb
        case medium
        case large
        case max
        case original
    }
    
    enum Sizes {
        case w45        // Logo |        | Profile |       |
        case w92        // Logo | Poster |         | Still |
        case w154       // Logo | Poster |         |       |
        case w185       // Logo | Poster | Profile | Still |
        case w300       // Logo |        |         |       | Cover
        case w342       //      | Poster |         |       |
        case w500       // Logo | Poster |         |       |
        case w780       //      | Poster |         |       | Cover
        case w1280      //      |        |         |       | Cover
        case h362       //      |        | Profile |       |
        case original   // Logo | Poster | Profile | Still | Cover
        
        //init
        
    }
    
    enum ImageType {
        case poster
        case cover
        case logo
        case profile
        case still
    }
    
    /*
    static func get(_ imageType: ImageType, size: ImageSize) -> URL {
        var imageURL = "https://image.tmdb.org/t/p/"
        switch imageType {
        case .poster:
            switch size {
            case .tiny:     imageURL += "w92"
            case .small:    imageURL += "w154"
            case .thumb:    imageURL += "w185"
            case .medium:   imageURL += "w342"
            case .large:    imageURL += "w500"
            case .max:      imageURL += "w780"
            case .original: imageURL += "original"
            }
        }
    }
    */
    
        
        
    var genreText: String {
        //genres?.first?.name ?? "n/a"
        var genre = genres?.first?.name ?? ""
        //if let genreString = genres as? MovieGenre { ... }
        //for genre in genres? { ... }
        if genres!.count > 1 {
            if genres?[1] != nil {
                genre = genre + ", \(genres![1].name)"
            }
        }
        
        #if DEBUG
        if genre.isEmpty {
            return "Some, Genres"
        }
        #endif
        
        return genre
        
    }
    
    var ratingText: String {
        let rating = Int(voteAverage)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "0"//"n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    var yearText: String {
        guard let releaseDate = self.releaseDate, let date = Utils.dateFormatter.date(from: releaseDate) else {
            return "0000"//"n/a"
        }
        return Movie.yearFormatter.string(from: date)
    }
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "0 minutes"//"n/a"
        }
        return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
    var cast: [MovieCast]? {
        credits?.cast
    }
    
    var crew: [MovieCrew]? {
        credits?.crew
    }
    
    var directors: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    
    var producers: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }
    
}

struct MovieGenre: Decodable {
    
    let name: String
}

struct MovieCredit: Decodable {
    
    let cast: [MovieCast]
    let crew: [MovieCrew]
}

struct MovieCast: Decodable, Identifiable {
    let id: Int
    let character: String
    let name: String
}

struct MovieCrew: Decodable, Identifiable {
    let id: Int
    let job: String
    let name: String
}

struct MovieVideoResponse: Decodable {
    
    let results: [MovieVideo]
}

struct MovieVideo: Decodable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
