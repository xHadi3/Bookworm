//
//  ContentView.swift
//  Bookworm
//
//  Created by Hadi Al zayer on 12/08/1446 AH.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query (sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.auther)
    ]) var books : [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(books){ book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment:.leading){
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.auther)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self){ book in
                DetailView(book: book)
            }
            .toolbar{
                
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add Book", systemImage: "plus"){
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen){
                addBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
    
}

#Preview {
    ContentView()
}
