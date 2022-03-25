//
//  CustomTextField.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct CustomTextField: View {
    var textTitle: String?
    var value: Binding<String>
    var roundedCorners: CGFloat?
    var textColor: Color?
    var lineWidth: Double?
    var shadowRadius: Double?
    var padding: CGFloat?
    var fontSize: CGFloat?

    var body: some View {
        TextField(textTitle ?? "", text: value)
         .background(Color("TxtFieldBlue"))
         .cornerRadius(roundedCorners ?? 0)
         .foregroundColor(textColor)
         .font(.custom("Open Sans", size: fontSize ?? 20))
         .shadow(radius: shadowRadius ?? 10)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @State static var value = ""
    static var previews: some View {
        CustomTextField(value: $value)
    }
}
