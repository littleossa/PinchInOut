//
//  ContentView.swift
//  PinchInOut
//
//  Created by 平岡修 on 2022/04/06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                // 前回の拡大率に対して今回の拡大率の割合を計算
                let changeRate = value / lastMagnificationValue
                // 前回からの変更割合分を乗算する
                magnifyBy *= changeRate
                // 前回の拡大率に今回の拡大率を渡す
                lastMagnificationValue = value
            }
            .onEnded { value in
                // 次回のジェスチャー時に1.0から始まる為、終了時に1.0に変更する
                lastMagnificationValue = 1.0
            }
    }
    
    var body: some View {
        Image(systemName: "logo.playstation")
            .resizable()
            .frame(width: 100, height: 77.5)
            .scaleEffect(magnifyBy)
            .gesture(magnification)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
