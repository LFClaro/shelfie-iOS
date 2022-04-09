//
//  MainView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-03-26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            CustomTabBar(viewRouter: ViewRouter())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
