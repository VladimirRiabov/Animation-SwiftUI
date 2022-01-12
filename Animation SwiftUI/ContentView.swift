//
//  ContentView.swift
//  Animation SwiftUI
//
//  Created by Владимир Рябов on 11.01.2022.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    @State private var isShowingRed = false
    
    
    var body: some View {
        
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
                
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
