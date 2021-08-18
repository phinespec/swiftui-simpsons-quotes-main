//
//  Extensions.swift
//  SimpsonsQuotes
//
//  Created by phinespec on 8/16/21.
//

import SwiftUI


extension String {
    
    func load() -> UIImage {
        
        do {
            // convert string to URL
            guard let url = URL(string: self) else {
                
                // return an empty image if URL is invalid
                return UIImage()
            }
            
            // convert URL to data
            let data: Data = try Data(contentsOf: url)
            
            // create UIImage object from data or
            return UIImage(data: data) ?? UIImage()
        
        } catch {
            
            // catch and print the error if there is one
            print(error.localizedDescription)
        }
        
        return UIImage()
        
    }
}
