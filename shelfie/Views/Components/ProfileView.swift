//
//  ProfileView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    var imageUrl: String?
    var id: Int?
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(Color("AccentColor"))
                    .offset(y: -geo.size.height * 0.5)
                    .clipped()
                Group {
                    if imageUrl != "" {
                        KFImage.url(URL(string: imageUrl ?? ""))
                            .placeholder {
                                ProgressView()
                                    .scaleEffect(2)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .resizable()
                            .id(id ?? 0)
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                    }
                }
                .scaledToFit()
                .background(Color("BackgroundColor"))
                .foregroundColor(Color("AccentColor"))
                .frame(height: 0.125 * sf.h)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("BackgroundColor"), lineWidth: 5).shadow(radius: 5))
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
