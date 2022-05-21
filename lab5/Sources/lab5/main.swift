class Player {
    var sign: String
    
    init(sign: String) {
        self.sign = sign
    }
}

class TicTacToe {
    var positions: [[Int]] = [[-1, -1, -1], [-1, -1, -1], [-1, -1, -1]]
    var humanPlayer: Player = Player(sign: "")
    var aiPlayer: Player = Player(sign: "")

    func addHumanPlayer(humanPlayer: Player) {
        self.humanPlayer = humanPlayer
    }

    func addAIPlayer(aiPlayer: Player) {
        self.aiPlayer = aiPlayer
    }

    func start() {
        while true {
            self.drawBoard()
            self.humanTakeTurn()
            self.aiTakeTurn()
            self.checkWin()
        }
    }

    func humanTakeTurn() {
        print("Input position 1 - 9")
        while true {
            if let input = readLine() {
                if let position = Int(input) {
                    for row in (0...2).reversed() {
                        if (position - 1) / 3 >= row {
                            let col = (position - 1) % 3
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

    func aiTakeTurn() {
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

    func checkWin() {
        print("No winners yet.")
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
                if col != 2 {
                    line += " | "
                }
            }
            if row != 0 {
                print("----------")
            }
            print(line)
        }
    }
}

var game = TicTacToe()
var humanPlayer: Player = Player(sign: "x")
var aiPlayer: Player = Player(sign: "o")
game.addHumanPlayer(humanPlayer: humanPlayer)
game.addAIPlayer(aiPlayer: aiPlayer)
game.start()
