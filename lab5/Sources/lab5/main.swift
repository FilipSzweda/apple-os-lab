import Foundation

class Player {
    var sign: String
    
    init(sign: String) {
        self.sign = sign
    }
}

class TicTacToe {
    var boardSize: Int
    var positions: [[Int]] = []
    var humanPlayer: Player = Player(sign: "")
    var aiPlayer: Player = Player(sign: "")

    init(boardSize: Int) {
        self.boardSize = boardSize
        for _ in 0..<self.boardSize {
            var row: [Int] = []
            for _ in 0..<self.boardSize {
                row.append(-1)
            }
            self.positions.append(row)
        }
    }

    func addHumanPlayer(humanPlayer: Player) {
        self.humanPlayer = humanPlayer
    }

    func addAIPlayer(aiPlayer: Player) {
        self.aiPlayer = aiPlayer
    }

    func start() {
        print("")
        while true {
            let winner = self.checkWinner()
            self.drawBoard()
            if winner == -1 {
                print("No winners yet")
            }
            else if winner == 0 {
                print("Player won")
                break
            }
            else if winner == 1 {
                print("AI won")
                break
            }
            self.humanTakesTurn()
            self.aiTakesTurn()
        }
    }

    func humanTakesTurn() {
        print("Input position 1 - \(Int(pow(Double(self.boardSize), Double(2))))")
        while true {
            if let input = readLine() {
                if let position = Int(input) {
                    for row in (0...(self.boardSize - 1)).reversed() {
                        if (position - 1) / (self.boardSize) >= row {
                            let col = (position - 1) % (self.boardSize)
                            if self.positions[row][col] == -1 {
                                self.positions[row][col] = 0
                                break
                            }
                            break
                        }
                    }
                    break
                }
            }
        }
    }

    func aiTakesTurn() {
        print("AI took turn")
        var possiblePositions:[(row: Int, col: Int)] = []
        for row in 0..<self.positions.count {
            for col in 0..<self.positions[row].count {
                if self.positions[row][col] == -1 {
                    possiblePositions.append((row: row, col: col))
                }
            }
        }
        let index: Int = Int.random(in: 0..<possiblePositions.count)
        self.positions[possiblePositions[index].0][possiblePositions[index].1] = 1
    }

    func checkWinner() -> Int {
        // check rows
        for row in 0..<positions.count {
            let number = positions[row][0]
            var numberCount = 1
            for col in 1..<positions.count {
                if positions[row][col] == number {
                    numberCount += 1
                }
            }
            if number != -1 && numberCount == positions.count {
                return number
            }
        }
        // check columns
        for col in 0..<positions.count {
            let number = positions[0][col]
            var numberCount = 1
            for row in 1..<positions.count {
                if positions[row][col] == number {
                    numberCount += 1
                }
            }
            if number != -1 && numberCount == positions.count {
                return number
            }
        }
        // check \ diagonal
        var number = positions[0][0]
        var numberCount = 1
        for diag in 1..<positions.count {
            if positions[diag][diag] == number {
                numberCount += 1
            }
        }
        if number != -1 && numberCount == positions.count {
            return number
        }
        // check / diagonal
        number = positions[positions.count - 1][positions.count - 1]
        numberCount = 1
        for diag in (0..<(positions.count - 1)).reversed() {
            if positions[diag][diag] == number {
                numberCount += 1
            }
        }
        if number != -1 && numberCount == positions.count {
            return number
        }
        return -1
    }

    func drawBoard() {
        for row in 0..<self.positions.count {
            var line: String = ""
            for col in 0..<self.positions[row].count {
                switch self.positions[row][col] {
                case -1:
                    line += " "
                case 0:
                    line += "x"
                case 1:
                    line += "o"
                default:
                    line += "error"
                }
                if col != (self.boardSize - 1) {
                    line += " | "
                }
            }
            if row != 0 {
                let dashesNumber = 2 + 3 * (self.boardSize - 2) + self.boardSize
                var divider: String = ""
                for _ in 0...dashesNumber {
                    divider += "-"
                }
                print(divider)
            }
            print(line)
        }
    }
}

var game = TicTacToe(boardSize: 5)
var humanPlayer: Player = Player(sign: "x")
var aiPlayer: Player = Player(sign: "o")
game.addHumanPlayer(humanPlayer: humanPlayer)
game.addAIPlayer(aiPlayer: aiPlayer)
game.start()
