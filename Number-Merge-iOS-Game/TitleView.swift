//
//  TitleView.swift
//  Number-Merge-iOS-Game
//
//  Created by 莊智凱 on 2022/4/19.
//

import SwiftUI

struct TitleView: View {
    
    @Binding var game : Game
    
    var body: some View {
        HStack {
            Text("Number Merge")
                .bold()
                .font(.largeTitle)
                .foregroundColor(Color(red: 120/255, green: 111/255, blue: 102/255))
            
            Spacer()
            
            Button {
                game.restartGame()
            } label: {
                Image(systemName: "arrow.counterclockwise.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(8.5)
                    .foregroundColor(.white)
                    .background(Color(red: 236/255, green: 140/255, blue: 85/255))
                    .cornerRadius(5)
            }
        }
    }
}
