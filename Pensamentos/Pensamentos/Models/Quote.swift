//
//  Quote.swift
//  Pensamentos
//
//  Created by Juan Fernandes on 14/07/23.
//

import Foundation

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "〝" + quote + "〞"
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
    
}
