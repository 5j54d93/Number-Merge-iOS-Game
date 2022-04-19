//
//  DashBoardView.swift
//  Number-Merge-iOS-Game
//
//  Created by 莊智凱 on 2022/4/19.
//

import SwiftUI

struct DashBoardView: View {
    
    @Binding var game : Game
    
    var body: some View {
        HStack(spacing: 30) {
            VStack {
                Text("SCORE")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color(red: 240/255, green: 224/255, blue: 213/255))
                
                Text("\(game.score)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 187/255, green: 174/255, blue: 161/255))
            .cornerRadius(5)
            
            VStack {
                Text("BEST")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color(red: 240/255, green: 224/255, blue: 213/255))
                
                Text("\(game.bestScore)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 187/255, green: 174/255, blue: 161/255))
            .cornerRadius(5)
        }
    }
}
