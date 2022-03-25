//
//  RegisterView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .frame(width: sf.w * 1.07, height: sf.h * 1.07)
            VStack{
                Image("logoShelfieWhite")
                    .resizable()
                    .position(x: sf.w * 0.25, y: sf.h * 0)
                    .frame(width: sf.w * 0.5, height: sf.h * 0.06)
                    
                Text("Sign Up")
                    .font(Font.custom("Montserrat", size: 32))
                    .foregroundColor(.white)
                    .frame(width: sf.w * 0.9, height: sf.h * 0.06, alignment: .topLeading)
                HStack{
                    VStack{
                        Text("First Name")
                            .foregroundColor(.white)
                            .frame(width: sf.w * 0.4, height: sf.h * 0.03, alignment: .topLeading)
                        CustomTextField(value: $firstName, roundedCornes: 10, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                            .frame(width: sf.w * 0.4, height: sf.h * 0.065, alignment: .topLeading)
                            .padding()
                    }
                    VStack{
                        Text("Last Name")
                            .foregroundColor(.white)
                            .frame(width: sf.w * 0.4, height: sf.h * 0.03, alignment: .topLeading)
                        CustomTextField(value: $lastName, roundedCornes: 10, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                            .frame(width: sf.w * 0.4, height: sf.h * 0.065, alignment: .topTrailing)
                            .padding()
                    }
                }
                Text("Email")
                    .foregroundColor(.white)
                    .frame(width: sf.w * 0.8, height: sf.h * 0.03, alignment: .topLeading)
                CustomTextField(value: $email, roundedCornes: 10, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                    .frame(width: sf.w * 0.8, height: sf.h * 0.065, alignment: .topTrailing)
                    .padding()
                Text("Password")
                    .frame(width: sf.w * 0.8, height: sf.h * 0.03, alignment: .topLeading)
                    .foregroundColor(.white)
                CustomTextField(value: $password, roundedCornes: 10, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                    .frame(width: sf.w * 0.8, height: sf.h * 0.065, alignment: .topTrailing)
                    .padding()
                Text("Confirm Password")
                    .frame(width: sf.w * 0.8, height: sf.h * 0.03, alignment: .topLeading)
                    .foregroundColor(.white)
                CustomTextField(value: $confirmPassword, roundedCornes: 10, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                    .frame(width: sf.w * 0.8, height: sf.h * 0.065, alignment: .topTrailing)
                    .padding()
                ButtonView(sf: sf, text: "SIGN UP", fontSize: sf.w * 0.08, hTextPadding: 20, color: Color("bgButton"), height: sf.h * 0.07) {
                    
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
