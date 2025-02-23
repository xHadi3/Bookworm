//
//  addBookView.swift
//  Bookworm
//
//  Created by Hadi Al zayer on 18/08/1446 AH.
//

import SwiftUI

struct addBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var auther = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    
    
    var isValid : Bool {
        if title.trimmingCharacters(in: .whitespaces).isEmpty ||
            auther.trimmingCharacters(in: .whitespaces).isEmpty ||
            genre.trimmingCharacters(in: .whitespaces).isEmpty {
            
            return false
        }
        
            return true
    }
    
    
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry","Romance", "Thriller"]
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Auther's name", text: $auther)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review"){
                    TextEditor(text: $review)
                    
                    ratingView(rating: $rating)
                    
                }
                
                Section{
                    Button("Save"){
                        let newBook = Book(title: title, auther: auther, genre: genre, review: review, rating: rating)
                    
                        
                        modelContext.insert(newBook)
                        dismiss()
                        
                    }.disabled(isValid == false)
                }
                
            }
            .navigationTitle("Add Book")
        }
        
    }
}

#Preview {
    addBookView()
}
