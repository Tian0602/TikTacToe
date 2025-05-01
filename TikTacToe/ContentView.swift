//
//  ContentView.swift
//  TikTacToe
//
//  Created by 梁天宁 on 2025/5/1.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameState = GameState()
    var body: some View {
        let borderSize = CGFloat(5)
        
        Text("Turn:" + gameState.turnText())
            .font(.title)
            .bold()
            .padding()
        Spacer()
        
        Text(String(format: "Crosses: %d", gameState.cScore))
            .font(.title)
            .bold()
            .padding()
        
        VStack(spacing: borderSize) {
            ForEach(0...2, id: \.self)
            {
                row in
                HStack(spacing: borderSize)
                {
                    ForEach(0...2, id: \.self)
                    {
                        column in
                        
                        let cell = gameState.board[row][column]
                        Text(cell.displayTile())
                            .font(.system(size: 60))
                            .foregroundStyle(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                    }
                }
            }
        }
        .background(Color.black)
        .padding()
        .alert(isPresented: $gameState.showAlert)
        {
            Alert(title: Text(gameState.alertMessage),
                  dismissButton: .default(Text("Okay"))
                  {
                    gameState.resetBoard()
            })
        }
        
        Text(String(format: "Naughts: %d", gameState.nScore))
            .font(.title)
            .bold()
            .padding()
        Spacer()
    }
}

#Preview {
    ContentView()
}
