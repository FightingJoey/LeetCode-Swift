# 51. [N-Queens](https://leetcode.com/problems/n-queens/)

## Question

The **n-queens** puzzle is the problem of placing `n` queens on an `n x n` chessboard such that no two queens attack each other.

Given an integer `n`, return *all distinct solutions to the **n-queens puzzle***. You may return the answer in **any order**.

Each solution contains a distinct board configuration of the n-queens' placement, where `'Q'` and `'.'` both indicate a queen and an empty space, respectively.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2020/11/13/queens.jpg)

```
Input: n = 4
Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above
```

**Example 2:**

```
Input: n = 1
Output: [["Q"]]
```

## [N 皇后](https://leetcode-cn.com/problems/n-queens/)

n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

## 解题思路

[基于集合的回溯](https://leetcode-cn.com/problems/n-queens/solution/nhuang-hou-by-leetcode-solution/)

## 代码实现

### Swift

```swift
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
```

### Python

```python
def solveNQueens(self, n: int) -> List[List[str]]:
    def generateBoard():
        board = list()
        for i in range(n):
            row[queens[i]] = "Q"
            board.append("".join(row))
            row[queens[i]] = "."
        return board

    def backtrack(row: int):
        if row == n:
            board = generateBoard()
            solutions.append(board)
        else:
            for i in range(n):
                if i in columns or row - i in diagonal1 or row + i in diagonal2:
                    continue
                queens[row] = i
                columns.add(i)
                diagonal1.add(row - i)
                diagonal2.add(row + i)
                backtrack(row + 1)
                columns.remove(i)
                diagonal1.remove(row - i)
                diagonal2.remove(row + i)
                
    solutions = list()
    queens = [-1] * n
    columns = set()
    diagonal1 = set()
    diagonal2 = set()
    row = ["."] * n
    backtrack(0)
    return solutions
```

## 复杂度分析

- 时间复杂度：*O*(n!)，其中 n 是皇后数量。
- 空间复杂度：O(n)