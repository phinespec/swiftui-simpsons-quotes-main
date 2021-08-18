//
//  DataService.swift
//  SimpsonsQuotes
//
//  Created by phinespec on 8/14/21.
//

import Foundation


struct DataService {
    
    let resourceURL: URL
    
    init() {
        let urlString = "https://thesimpsonsquoteapi.glitch.me/quotes"
        
        guard let url = URL(string: urlString) else { fatalError() }
            
        self.resourceURL = url
    }
    
    func fetchData(completion: @escaping (Result<[Quote], QuoteError>) -> Void) {
        
        URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode([Quote].self, from: data) {
                    DispatchQueue.main.async {
                        completion(.success(decodedData))
                    }
                }
            } else {
                completion(.failure(.noDataAvailable))
            }
        }.resume()
    }
}

enum QuoteError: Error {
    case noDataAvailable
    case cannotProcessData
}


/**
 
 
     func getQuotes (completion: @escaping(Result<[SimpsonsQuote], QuoteError>) -> Void) {
         
         let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
             guard let jsonData = data else {
                 completion(.failure(.noDataAvailable))
                 return
         }
             
             do {
                 let decoder = JSONDecoder()
                 let quoteResponse = try decoder.decode([SimpsonsQuote].self, from: jsonData)
                 let quotes = quoteResponse
                 completion(.success(quotes))
             } catch {
                 completion(.failure(.cannotProcessData))
             }
             
         }
         dataTask.resume()
     }
 */
