//
//  CustomPlaceHolderModifer.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

public struct PlaceHolderStyle: ViewModifier {
    var showPlaceHolder: Binding<Bool>?
    var placeholder: String?
    var placeHolderFontSize: CGFloat?
    var rightViewImage: String?
    var rightViewSize: CGFloat?
    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder?.wrappedValue ?? true {
                HStack{
                    Image(systemName:rightViewImage ?? "")
                        .foregroundColor(Color("placeHolderCol"))
                    Text(placeholder ?? "")
                    .padding(.horizontal, 15)
                    .foregroundColor(Color("placeHolderCol"))
                }
         
            }
            content
            .foregroundColor(Color.gray)
            .padding(5.0)
            .font(.system(size: placeHolderFontSize ?? 20))
        }
    }
}
