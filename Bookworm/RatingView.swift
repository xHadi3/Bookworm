//
//  ratingView.swift
//  Bookworm
//
//  Created by Hadi Al zayer on 18/08/1446 AH.
//

import SwiftUI

struct ratingView: View {
    
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    
    
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            ForEach(1..<maximumRating + 1 , id: \.self){ number in
                Button{
                    rating = number
                }label: {
                    image(for: number)
                        .foregroundColor(number > rating ? offColor : onColor)
                }
                
            }
        }
        .buttonStyle(.plain)
    }
    
    func image (for number: Int) ->Image {
        if number > rating{
            offImage ?? onImage
        } else{
            onImage
        }
    }
    
}

#Preview {
    ratingView(rating: .constant(3))
}
