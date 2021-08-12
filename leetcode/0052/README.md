# 52. [N-Queens II](https://leetcode.com/problems/n-queens-ii)

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

## [N 皇后II](https://leetcode-cn.com/problems/n-queens-ii/)

n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

给你一个整数 `n` ，返回 **n 皇后问题** 不同的解决方案的数量。

## 解题思路

和 51.N皇后问题解法一样，只是把返回所有的解改为解的数量。

## 代码实现

### Swift

```swift
var solutions = [[String]]()
var queens = [Int]()
var columuns = Set<Int>()
var diagonal1 = Set<Int>()
var diagonal2 = Set<Int>()
var row = [String]()
func totalNQueens(_ n: Int) -> Int {
    queens = Array.init(repeating: -1, count: n)
    row = Array.init(repeating: ".", count: n)
    backtrace(row: 0, n: n)
    return solutions.count
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
def totalNQueens(n: int) -> int:
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
    return len(solutions)
```

## 复杂度分析

- 时间复杂度：*O*(n!)，其中 n 是皇后数量。
- 空间复杂度：O(n)