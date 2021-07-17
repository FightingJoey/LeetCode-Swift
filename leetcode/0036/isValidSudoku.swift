func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = [[Int: Int]]()
    var columns = [[Int: Int]]()
    var boxes = [[Int: Int]]()
    for _ in 0..<9 {
        rows.append([Int: Int]())
        columns.append([Int: Int]())
        boxes.append([Int: Int]())
    }
    
    for i in 0..<9 {
        for j in 0..<9 {
            let char = board[i][j]
            if char != "." {
                let num = Int(String(char)) ?? 0
                let boxIndex = (i / 3) * 3 + j / 3
                
                if let n = rows[i][num] {
                    rows[i][num] = n + 1
                } else {
                    rows[i][num] = 1
                }
                if let n = columns[j][num] {
                    columns[j][num] = n + 1
                } else {
                    columns[j][num] = 1
                }
                if let n = boxes[boxIndex][num] {
                    boxes[boxIndex][num] = n + 1
                } else {
                    boxes[boxIndex][num] = 1
                }
                
                if rows[i][num]! > 1 || columns[j][num]! > 1 || boxes[boxIndex][num]! > 1 {
                    return false
                }
            }
        }
    }
    return true
}
isValidSudoku(
    [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])
