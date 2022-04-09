//
//  Tabs.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-03-13.
//

import SwiftUI

struct Tabs<Label: View>: View {
    @Binding var tabs: [String] // The tab titles
    @Binding var selection: Int // Currently selected tab
    
    //Colors
    let backgroundSelectedColor: Color = Color("DarkPurple")
    let backgroundUnselectedColor: Color = Color("bgButton")
    let foregroundSelectedColor: Color = Color(.white)
    let foregroundUnselectedColor: Color = Color(.white)
    
    //Shape for clipping
    let shape = RoundedRectangle(cornerRadius: 30)
    
    // Tab label rendering closure - provides the current title and if it's the currently selected tab
    let label: (String, Bool) -> Label
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(tabs, id: \.self) {
                self.tab(title: $0)
            }
        }
        .clipShape(shape)
    }
    
    public func tab(title: String) -> some View {
        let index = self.tabs.firstIndex(of: title)!
        let isSelected = index == selection
        return Button(action: {
            withAnimation(.spring()) {
                self.selection = index
            }
        }) {
            label(title, isSelected)
                .padding(.vertical)
                .background(isSelected ? backgroundSelectedColor : backgroundUnselectedColor)
                .foregroundColor(isSelected ? foregroundSelectedColor : foregroundUnselectedColor)
                .transition(.move(edge: .leading))
        }
    }
}


struct Tabs_Previews: PreviewProvider {
    @State static var tabs = ["Full View", "List View"]
    @State static var selectedTab = 0
    
    static var previews: some View {
        Tabs(tabs: .constant(tabs), selection: $selectedTab) {title, isSelected in
            Text(title)
                .frame(maxWidth: sf.w * 0.5)
                .font(.custom("Avenir-Black", size: sf.h * 0.025))
        }
    }
}
