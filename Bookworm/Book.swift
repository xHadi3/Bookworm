//
//  Book.swift
//  Bookworm
//
//  Created by Hadi Al zayer on 18/08/1446 AH.
//

import Foundation
import SwiftData

@Model
class Book{
    var title:String
    var auther: String
    var genre: String
    var review: String
    var rating: Int
    
    init(title: String, auther: String, genre: String, review: String, rating: Int) {
        self.title = title
        self.auther = auther
        self.genre = genre
        self.review = review
        self.rating = rating
    }
    
    
}
