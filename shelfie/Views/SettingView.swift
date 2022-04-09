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
        let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
        let version = appVersion as? String ?? ""
        let appBuild = Bundle.main.infoDictionary!["CFBundleVersion"]
        let build = appBuild as? String ?? ""
        
        VStack{
            Text("Settings")
                .font(.custom("Avenir-Black", size: sf.h * 0.04))
                .frame(maxWidth: .infinity, alignment: .leading)
            
                Section{
                    Toggle(isOn: $isNotify) {
                            Text("Allow Notifications")
                            .font(.custom("Avenir", size: sf.h * 0.02))
                        }
                }.padding()
                Section{
                    Toggle(isOn: $isPublic) {
                            Text("Make my Profile Public")
                            .font(.custom("Avenir", size: sf.h * 0.02))
                        }
                }.padding()
                Section{
                    HStack{
                        Text("Show Prices in:         ")
                            .font(.custom("Avenir", size: sf.h * 0.02))
                        Picker("", selection: $prices) {
                                         ForEach(Prices.allCases) { price in
                                             Text(price.rawValue).tag(price)
                                         }
                                        
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }.padding()
            Text("Terms of Use")
                .font(Font.custom("Avenir", size: sf.w * 0.08))
                .frame(maxWidth: sf.w, minHeight: sf.h * 0.08, alignment: .center)
                .foregroundColor(Color("LinkBlue"))
            Text("Privacy Policy")
                .font(Font.custom("Avenir", size: sf.w * 0.08))
                .frame(maxWidth: sf.w, minHeight: sf.h * 0.08, alignment: .center)
                .foregroundColor(Color("LinkBlue"))
            Text("Contact Us")
                .font(Font.custom("Avenir", size: sf.w * 0.08))
                .frame(maxWidth: sf.w, minHeight: sf.h * 0.08, alignment: .center)
                .foregroundColor(Color("LinkBlue"))

            Text(("Version \(version)  |  Build \(build)"))
                .font(Font.custom("Avenir", size: sf.w * 0.05))
                .foregroundColor(Color("versionText"))
            Text("Copyright © 2022 Roll 42 Inc.")
                .font(Font.custom("Avenir", size: sf.w * 0.05))
                .foregroundColor(Color("versionText"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
