# 37. [Sudoku Solver](https://leetcode.com/problems/sudoku-solver)

## Question


Write a program to solve a Sudoku puzzle by filling the empty cells.

A sudoku solution must satisfy **all of the following rules**:

1. Each of the digits `1-9` must occur exactly once in each row.
2. Each of the digits `1-9` must occur exactly once in each column.
3. Each of the digits `1-9` must occur exactly once in each of the 9 `3x3` sub-boxes of the grid.

The `'.'` character indicates empty cells.

**Example 1:**

![img](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2021/04/12/250px-sudoku-by-l2g-20050714svg.png)

```
Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
```

Explanation: The input board is shown above and the only valid solution is shown below:

![ss](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2021/04/12/250px-sudoku-by-l2g-20050714_solutionsvg.png)

**Constraints:**

- `board.length == 9`
- `board[i].length == 9`
- `board[i][j]` is a digit or `'.'`.
- It is **guaranteed** that the input board has only one solution.

## [解数独](https://leetcode-cn.com/problems/sudoku-solver)

编写一个程序，通过填充空格来解决数独问题。

数独的解法需 遵循如下规则：

- 数字 1-9 在每一行只能出现一次。
- 数字 1-9 在每一列只能出现一次。
- 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）

数独部分空格内已填入了数字，空白格用 '.' 表示。

## 解题思路

最容易想到的方法是用一个数组记录每个数字是否出现。由于我们可以填写的数字范围为 [1,9]，而数组的下标从 0 开始，因此在存储时，我们使用一个长度为 9 的布尔类型的数组，其中 i 个元素的值为 True，当且仅当数字 i+1 出现过。例如我们用 `line[2][3]=True` 表示数字 4 在第 2 行已经出现过，那么当我们在遍历到第 2 行的空白格时，就不能填入数字 4。

我们首先对整个数独数组进行遍历，当我们遍历到第 i 行第 j 列的位置：

- 如果该位置是一个空白格，那么我们将其加入一个用来存储空白格位置的列表中，方便后续的递归操作；

- 如果该位置是一个数字 x，那么我们需要将 `line[i][x−1]`，`column[j][x−1]` 以及 `block[i/3][j/3][x−1]` 均置为 True。

当我们结束了遍历过程之后，就可以开始递归枚举。当递归到第 i 行第 j 列的位置时，我们枚举填入的数字 x。根据题目的要求，数字 x 不能和当前行、列、九宫格中已经填入的数字相同，因此 `line[i][x−1]`，`column[j][x−1]` 以及 `block[i/3][j/3][x−1]` 必须均为 False。

当我们填入了数字 x 之后，我们要将上述的三个值都置为 True，并且继续对下一个空白格位置进行递归。在回溯到当前递归层时，我们还要将上述的三个值重新置为 False。

## 代码实现

### Swift

```swift
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
```

### Python

```python
def solveSudoku(board: [[str]]) -> None:
    def dfs(pos: int):
        nonlocal valid
        if pos == len(spaces):
            valid = True
            return
        
        i, j = spaces[pos]
        for digit in range(9):
            if line[i][digit] == column[j][digit] == block[i // 3][j // 3][digit] == False:
                line[i][digit] = column[j][digit] = block[i // 3][j // 3][digit] = True
                board[i][j] = str(digit + 1)
                dfs(pos + 1)
                line[i][digit] = column[j][digit] = block[i // 3][j // 3][digit] = False
            if valid:
                return
        
    line = [[False] * 9 for _ in range(9)]
    column = [[False] * 9 for _ in range(9)]
    block = [[[False] * 9 for _a in range(3)] for _b in range(3)]
    valid = False
    spaces = list()

    for i in range(9):
        for j in range(9):
            if board[i][j] == ".":
                spaces.append((i, j))
            else:
                digit = int(board[i][j]) - 1
                line[i][digit] = column[j][digit] = block[i // 3][j // 3][digit] = True

    dfs(0)
```

## 复杂度分析

- 时间复杂度：O(1)
- 空间复杂度：O(1)