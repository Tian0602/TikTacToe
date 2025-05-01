//
//  GameState.swift
//  TikTacToe
//
//  Created by 梁天宁 on 2025/5/1.
//

import Foundation

class GameState: ObservableObject
{
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var nScore = 0
    @Published var cScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    init()
    {
        resetBoard()
    }
    func turnText() -> String
    {
        return turn == Tile.Cross ? "X" : "O"
    }
    func checkForVictory() -> Bool
    {
        for i in 0...2
        {
            if(isTurnTile(i, 0) && isTurnTile(i, 1) && isTurnTile(i, 2))
            {
                return true
            }
            if(isTurnTile(0, i) && isTurnTile(1, i) && isTurnTile(2, i))
            {
                return true
            }
        }
        
        // diagonal check
        if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2)
        {
            return true
        }
        if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0)
        {
            return true
        }
        return false
    }
    func isTurnTile(_ row: Int, _ column: Int) -> Bool
    {
        return board[row][column].tile == turn
    }
    func checkForDraw() -> Bool
    {
        for row in board
        {
            for cell in row
            {
                if cell.tile == Tile.Empty
                {
                    return false
                }
            }
        }
        return true
    }
    func placeTile(_ row: Int, _ column: Int)
    {
        if(board[row][column].tile != Tile.Empty) {
            return
        }
        board[row][column].tile = turn == Tile.Cross ? Tile.Cross : Tile.Naught
        
        if(checkForVictory())
        {
            var winner = "Corsses"
            if(turn == Tile.Cross)
            {
                cScore += 1
            }
            else
            {
                winner = "Noughts"
                nScore += 1
            }
            alertMessage = winner + " Win!"
            showAlert = true
        }
        else
        {
            turn = turn == Tile.Cross ? Tile.Naught : Tile.Cross
        }
        
        if(checkForDraw())
        {
            alertMessage = "Draw"
            showAlert = true
        }
    }
    func resetBoard()
    {
        var newBoard = [[Cell]]()
        
        for _ in 0...2
        {
            var row = [Cell]()
            for _ in 0...2
            {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
