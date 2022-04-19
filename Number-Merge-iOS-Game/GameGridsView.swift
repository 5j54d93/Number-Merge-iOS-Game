//
//  GameGridsView.swift
//  Number-Merge-iOS-Game
//
//  Created by 莊智凱 on 2022/4/19.
//

import SwiftUI

struct GameGridsView: View {
    
    @Binding var game : Game
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(spacing: 15), count: 5), spacing: 15) {
            ForEach(0..<25) { index in
                if game.grids[index].value == 0 {
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: .infinity, height: geo.size.width)
                            .foregroundColor(game.grids[index].gridColor)
                            .cornerRadius(8)
                    }
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        game.grids[index].value = game.randomGrid.value
                        game.checkMerge(index: index)
                        game.nextRandomGrid()
                        game.checkEnd()
                    }
                } else {
                    GeometryReader { geo in
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: geo.size.width)
                                .foregroundColor(game.grids[index].gridColor.opacity(game.isEnd ? 0.7 : 1))
                                .cornerRadius(8)
                            
                            Text("\(game.grids[index].value)")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(game.grids[index].textColor.opacity(game.isEnd ? 0.7 : 1))
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                }
            }
        }
        .padding()
        .background(Color(red: 187/255, green: 174/255, blue: 161/255, opacity: game.isEnd ? 0.7 : 1))
        .cornerRadius(5)
        .padding(.bottom)
        .overlay {
            if game.isEnd {
                VStack {
                    Text("Game Over")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(red: 120/255, green: 111/255, blue: 102/255))
                    
                    Button {
                        game.restartGame()
                    } label: {
                        Text("Try again")
                            .bold()
                            .font(.title)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 30)
                            .foregroundColor(Color(red: 239/255, green: 228/255, blue: 218/255))
                            .background(Color(red: 120/255, green: 111/255, blue: 102/255))
                            .cornerRadius(5)
                    }
                }
            }
        }
        
        LazyVGrid(columns: Array(repeating: GridItem(spacing: 15), count: 5), spacing: 15) {
            ForEach(0..<5) { index in
                if (index == 2) {
                    GeometryReader { geo in
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: geo.size.width)
                                .foregroundColor(game.randomGrid.gridColor)
                                .cornerRadius(8)
                            
                            Text("\(game.randomGrid.value)")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(game.randomGrid.textColor)
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                } else {
                    GeometryReader { geo in
                        Rectangle()
                            .frame(width: .infinity, height: geo.size.width)
                            .foregroundColor(Color(red: 250/255, green: 248/255, blue: 239/255))
                    }
                    .aspectRatio(contentMode: .fit)
                }
            }
        }
        .padding(.top)
    }
}
