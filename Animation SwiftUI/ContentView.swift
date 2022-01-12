//
//  ContentView.swift
//  Animation SwiftUI
//
//  Created by Владимир Рябов on 11.01.2022.
//

import SwiftUI
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let ancor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: ancor)
        //чтобы обрезался в пределах квадрата будущего, а то он начинает крутиться его сверху видно и он опускается
            .clipped()
        
    }
}
extension AnyTransition {
    //ось
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, ancor: .topLeading), identity: CornerRotateModifier(amount: 0, ancor: .topLeading))
    }
        
}


struct ContentView: View {
    @State private var isShowingRed = false
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
       
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
