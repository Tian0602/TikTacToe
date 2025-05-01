//
//  Cell.swift
//  TikTacToe
//
//  Created by 梁天宁 on 2025/5/1.
//

import Foundation
import SwiftUI

struct Cell
{
    var tile: Tile
    
    func displayTile() -> String
    {
        switch(tile)
        {
            case Tile.Naught:
                return "O"
            case Tile.Cross:
                return "X"
            default:
                return ""
        }
    }
    
    func tileColor() -> SwiftUI.Color
    {
        switch(tile)
        {
            case Tile.Naught:
                return Color.red
            case Tile.Cross:
                return Color.black
            default:
                return Color.black
        }
    }
}
enum Tile
{
    case Naught
    case Cross
    case Empty
}
