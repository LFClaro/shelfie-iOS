//
//  RegisterView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var didScreenLoad: Bool = false
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        ZStack{
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                
                ZStack{
                    Image("logoShelfieWhite")
                            .resizable().scaledToFit()
                            .frame(width: sf.w * 0.5)
                    
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "chevron.backward")
                            .font(.largeTitle.bold())
                            .opacity(didScreenLoad ? 1 : 0)
                            .rotationEffect(.degrees(didScreenLoad ? 0 : -90))
                            .animation(.spring().delay(0.2), value: didScreenLoad)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                Spacer()
                Text("Sign Up")
                    .font(.custom("Avenir-Black", size: sf.h * 0.04))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: sf.h * 0.005){
                    HStack{
                        VStack(alignment: .leading, spacing: sf.h * 0.005){
                            Text("First Name").font(.custom("Avenir", size: sf.h * 0.03))
                            CustomTextField(value: $firstName, roundedCorners: 30, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                                .frame(height: sf.h * 0.065)
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: sf.h * 0.005){
                            Text("Last Name").font(.custom("Avenir", size: sf.h * 0.03))
                            CustomTextField(value: $lastName, roundedCorners: 30, textColor: .white, shadowRadius: 5, padding: 0, fontSize: sf.h * 0.05)
                                .frame(height: sf.h * 0.065)
                        }
                    }
                    Text("Email").font(.custom("Avenir", size: sf.h * 0.03))
                    CustomTextField(value: $email, roundedCorners: 30, textColor: .white, shadowRadius: 5, fontSize: sf.h * 0.05)
                        .frame(height: sf.h * 0.065)
                    Text("Password").font(.custom("Avenir", size: sf.h * 0.03))
                    CustomTextField(value: $password, roundedCorners: 30, textColor: .white, shadowRadius: 5, fontSize: sf.h * 0.05)
                        .frame(height: sf.h * 0.065)
                    Text("Confirm Password").font(.custom("Avenir", size: sf.h * 0.03))
                    CustomTextField(value: $confirmPassword, roundedCorners: 30, textColor: .white, shadowRadius: 5, fontSize: sf.h * 0.05)
                        .frame(height: sf.h * 0.065)
                }.padding()
                
                Spacer()
                Spacer()
                
                ButtonView(text: "SIGN UP")
                
                Spacer()
            }.padding()
        }
        .foregroundColor(.white)
        .navigationBarHidden(true)
        .onAppear {
            didScreenLoad.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
