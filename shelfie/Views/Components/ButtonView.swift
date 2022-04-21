//
//  ButtonView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-03-25.
//

import SwiftUI

struct ButtonView: View {
    var sf = ScaleFactor()
    var text: String?
    var fontSize: CGFloat?
    var hTextPadding: CGFloat?
    var color = LinearGradient(gradient: Gradient(colors: [Color("BtnBlue"), Color("BtnPurple")]), startPoint: .top, endPoint: .bottom)
    var height: CGFloat?
    var width: CGFloat?
    var action: (() -> Void)?
    var image: String?
    
    var body: some View {
        Button(action: self.action ?? {}) {
            HStack{
                Image(systemName: image ?? "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(alignment: .leading)
                        .padding(sf.h * 0.01)
                Text(text ?? "vghvhjvhjvhjvhvh")
                .font(Font.custom("Avenir-Black", size: fontSize ?? 0.027 * sf.w))
                .padding(.horizontal, hTextPadding ?? 0.07 * sf.h)
                .foregroundColor(Color.white)

            }
        }
        .foregroundColor(Color.white)
        .frame(width: width ?? sf.w * 0.8,height: height ?? 0.06 * sf.h)
        .background(color)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
