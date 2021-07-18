var rows = [[Bool]]()
var columns = [[Bool]]()
var boxes = [[[Bool]]]()
var vaild = false
var spaces = [(Int, Int)]()

func solveSudoku(_ board: inout [[Character]]) {
    for _ in 0..<9 {
        rows.append([false,false,false,false,false,false,false,false,false])
        columns.append([false,false,false,false,false,false,false,false,false])
    }
    for _ in 0..<3 {
        var temp = [[Bool]]()
        for _ in 0..<3 {
            temp.append([false,false,false,false,false,false,false,false,false])
        }
        boxes.append(temp)
    }
    
    for i in 0..<9 {
        for j in 0..<9 {
            if board[i][j] == "." {
                spaces.append((i, j))
            } else {
                let digit = (Int(String(board[i][j])) ?? 1) - 1
                rows[i][digit] = true
                columns[j][digit] = true
                boxes[i/3][j/3][digit] = true
            }
        }
    }
    dfs(0, &board)
}

func dfs(_ pos: Int, _ board: inout [[Character]]) {
    if pos == spaces.count {
        vaild = true
        return
    }
    let (i, j) = spaces[pos]
    for digit in 0..<9 {
        if rows[i][digit] == false && columns[j][digit] == false && boxes[i/3][j/3][digit] == false {
            rows[i][digit] = true
            columns[j][digit] = true
            boxes[i/3][j/3][digit] = true
            board[i][j] = Character(String(digit + 1))
            dfs(pos + 1, &board)
            rows[i][digit] = false
            columns[j][digit] = false
            boxes[i/3][j/3][digit] = false
        }
        if vaild {
            return
        }
    }
}


var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

solveSudoku(&board)

print(board)

