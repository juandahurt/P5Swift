//
//  GameOfLife.swift
//  P5Demo
//
//  Created by Juan Hurtado on 17/06/23.
//

import UIKit
import CoreGraphics
import P5Swift

/// The game of life!
///
/// This example is a game of life representation with a certain percentage of alives cells
/// in the initial population. You can change this value updating the `alpha` variable.
///
/// Note that there's a variable to update the frames per second called `fps`.
class GameOfLife: P5Sketch {
    let rows = 70
    let cols = 50
    
    let fps = 10.0
    let alpha = 0.15
    
    var population: [[Cell]] = []
    
    override func setup() {
        title = "Game of life"
        frameRate(fps)
        for _ in 0..<rows {
            var row = [Cell]()
            for _ in 0..<cols {
                row.append(.init(state: Double.random(in: 0...1) < alpha ? .alive : .dead))
            }
            population.append(row)
        }
    }
    
    override func draw() {
        let cellWidth = width / CGFloat(cols)
        let cellHeight = height / CGFloat(rows)
        for row in 0..<rows {
            for col in 0..<cols {
                let cell = population[row][col]
                fill(getColor(forCell: cell))
                rect(Double(col) * cellWidth, CGFloat(row) * cellHeight, cellWidth, cellHeight)
            }
        }
        
        newGeneration()
    }
    
    func getColor(forCell cell: Cell) -> CGColor {
        return cell.state == .alive ? UIColor.black.cgColor : UIColor.white.cgColor
    }
    
    func newGeneration() {
        var newPopulation: [[Cell]] = []
        newPopulation.append([Cell](repeating: .init(state: .dead), count: rows))
        for rowIndex in 1..<rows-1 {
            var newRow = [Cell]()
            newRow.append(.init(state: .dead))
            for colIndex in 1..<cols-1 {
                let cell = population[rowIndex][colIndex]
                var lives = 0
                for neighRowOffset in -1...1 {
                    for neighColOffset in -1...1 {
                        let row = rowIndex + neighRowOffset
                        let col = colIndex + neighColOffset
                        let neighbor = population[row][col]
                        lives += neighbor.state == .alive ? 1 : 0
                    }
                }
                if cell.state == .alive && lives < 2 {
                    newRow.append(.init(state: .dead))
                } else if cell.state == .alive && (lives == 2 || lives == 3) {
                    newRow.append(.init(state: .alive))
                } else if cell.state == .alive && lives > 3 {
                    newRow.append(.init(state: .dead))
                } else if cell.state == .dead && lives == 3 {
                    newRow.append(.init(state: .alive))
                } else {
                    newRow.append(.init(state: .dead))
                }
            }
            newRow.append(.init(state: .dead))
            newPopulation.append(newRow)
        }
        newPopulation.append([Cell](repeating: .init(state: .dead), count: rows))
        population = newPopulation
    }
}

struct Cell {
    var state: State
    enum State {
        case alive, dead
    }
}
