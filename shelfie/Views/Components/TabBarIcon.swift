//
//  TabBarIcon.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-20.
//

import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            if (viewRouter.currentPage == assignedPage) {
                LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask {
                        Image(systemName: systemIconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: height)
                            .padding(.top, 10)
                        //                        Text(tabName)
                        //                            .font(.footnote)
                    }
            } else {
                LinearGradient(colors: [Color("NavUnselected"), Color("placeHolderCol")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask {
                        Image(systemName: systemIconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: height)
                            .padding(.top, 10)
                        //                        Text(tabName)
                        //                            .font(.footnote)
                    }
            }
            
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}
