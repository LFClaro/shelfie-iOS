//
//  ProfilePicture.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI
import Kingfisher

struct ProfilePicture: View {
    var imageUrl: String?
    var id: Int?
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Group {
                    if imageUrl != nil {
                        AsyncImage(url: URL(string: imageUrl ?? "")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                                .scaleEffect(2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                    }
                }
                .scaledToFit()
                .background(.white)
                .foregroundColor(Color("BtnBlue"))
                .clipShape(Circle())
                .scaleEffect(0.80)
                .overlay(Circle().stroke(Color("bgButton"), lineWidth: 3).shadow(radius: 5)
                .scaleEffect(0.80))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
            }
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicture()
    }
}
