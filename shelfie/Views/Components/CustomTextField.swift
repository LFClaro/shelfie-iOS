//
//  CustomTextField.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct CustomTextField: View {
    @State var isShowPlaceHolder = true
    var placeHolder: String?
    var value: Binding<String>
    var roundedCorners: CGFloat?
    var textColor: Color?
    var lineWidth: Double?
    var shadowRadius: Double?
    var fontSize: CGFloat?
    var bgColor: Color?
    var placeHolderFontSize: CGFloat?
    var padding: CGFloat?
    var rightViewImage: String?
    var rightViewSize: CGFloat?
    
    var body: some View {
        TextField("", text: value)
         .modifier(PlaceHolderStyle(showPlaceHolder: $isShowPlaceHolder, placeholder: placeHolder, rightViewImage: rightViewImage ?? "", rightViewSize: rightViewSize ?? 0))
         .padding(padding ?? 0)
         .background(bgColor ?? Color("TxtFieldBlue"))
         .cornerRadius(roundedCorners ?? 0)
         .foregroundColor(textColor)
         .font(.custom("Open Sans", size: fontSize ?? 20))
         .shadow(radius: shadowRadius ?? 10)
         .onChange(of: isShowPlaceHolder) { newValue in
             isShowPlaceHolder.toggle()
         }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @State static var value = ""
    @State static var color = Color("TxtFieldBlue")
    static var previews: some View {
        CustomTextField(value: $value, bgColor: color)
    }
}
