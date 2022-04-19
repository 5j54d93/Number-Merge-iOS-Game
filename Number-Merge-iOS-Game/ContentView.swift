//
//  ContentView.swift
//  Number-Merge-iOS-Game
//
//  Created by 莊智凱 on 2022/4/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var game = Game()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 30) {
                TitleView(game: $game)
                
                DashBoardView(game: $game)
                
                GameGridsView(game: $game)
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
        .background(Color(red: 250/255, green: 248/255, blue: 239/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
