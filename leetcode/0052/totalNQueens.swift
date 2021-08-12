var solutions = [[String]]()
var queens = [Int]()
var columuns = Set<Int>()
var diagonal1 = Set<Int>()
var diagonal2 = Set<Int>()
var row = [String]()
func solveNQueens(_ n: Int) -> [[String]] {
    queens = Array.init(repeating: -1, count: n)
    row = Array.init(repeating: ".", count: n)
    backtrace(row: 0, n: n)
    return solutions
}

func backtrace(row: Int, n: Int) {
    if row == n {
        let board = generateBoard(n: n)
        solutions.append(board)
    } else {
        for i in 0..<n {
            if columuns.contains(i) || diagonal1.contains(row-i) || diagonal2.contains(row+i) {
                continue
            }
            queens[row] = i
            columuns.insert(i)
            diagonal1.insert(row-i)
            diagonal2.insert(row+i)
            backtrace(row: row + 1, n: n)
            columuns.remove(i)
            diagonal1.remove(row-i)
            diagonal2.remove(row+i)
        }
    }
}

func generateBoard(n: Int) -> [String] {
    var board = [String]()
    for i in 0..<n {
        row[queens[i]] = "Q"
        board.append(row.joined())
        row[queens[i]] = "."
    }
    return board
}

