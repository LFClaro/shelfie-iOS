//
//  SettingView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-09.
//

import SwiftUI

struct SettingView: View {
    @State var isNotify: Bool = false
    @State var isPublic: Bool = false
    @State var prices: Prices = .CAD
    enum Prices: String, CaseIterable, Identifiable {
        case CAD
        case USD
        var id: String { self.rawValue }
    }
    var body: some View {
        VStack{
            Text("Settings")
                .font(Font.custom("Montserrat", size: sf.w * 0.1))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
                Section{
                    Toggle(isOn: $isNotify) {
                            Text("Allow Notifications")
                            .foregroundColor(.white)
                        }
                }.padding()
                Section{
                    Toggle(isOn: $isPublic) {
                            Text("Make my Profile Public")
                            .foregroundColor(.white)
                        }
                }.padding()
                Section{
                    HStack{
                        Text("Show Prices in:         ")
                        Picker("", selection: $prices) {
                                         ForEach(Prices.allCases) { price in
                                             Text(price.rawValue).tag(price)
                                         }
                                        
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }.padding()
            Text("Terms of Use")
                .font(Font.custom("Montserrat", size: sf.w * 0.08))
                .frame(width: sf.w * 1, height: sf.h * 0.08, alignment: .center)
                .foregroundColor(Color("LinkBlue"))
            Text("Privacy Policy")
                .font(Font.custom("Montserrat", size: sf.w * 0.08))
                .frame(width: sf.w * 1, height: sf.h * 0.08, alignment: .center)
                .foregroundColor(Color("LinkBlue"))
            Text("Contact Us")
                .font(Font.custom("Montserrat", size: sf.w * 0.08))
                .frame(width: sf.w * 1, height: sf.h * 0.08, alignment: .center)
                .foregroundColor(Color("LinkBlue"))

            Text("Version 1.0  •  Build 1")
                .font(Font.custom("Montserrat", size: sf.w * 0.05))
                .foregroundColor(Color("versionText"))
            Text("Copyright © 2022 Roll 42 Inc.")
                .font(Font.custom("Montserrat", size: sf.w * 0.05))
                .foregroundColor(Color("versionText"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
