//
//  DetailView.swift
//  Bookworm
//
//  Created by Hadi Al zayer on 19/08/1446 AH.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismis
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre)
                    .resizable()
                    .scaledToFill()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.auther)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()

            ratingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book",isPresented: $showingDeleteAlert){
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel){}
            
        }message: {
            Text("Are you sure ?")
        }
        .toolbar{
            Button("Delete this book", systemImage: "trash"){
                showingDeleteAlert = true
            }
        }
    }
    func deleteBook(){
        modelContext.delete(book)
        dismis()
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", auther: "Test Auther", genre: "Fantasy", review: "This was a great book, I realy enjoyed it", rating: 4)
        
       return  DetailView(book: example)
            .modelContainer(container)
    }catch{
        return Text("Failed to create preview")
    }
    
    
   
}
