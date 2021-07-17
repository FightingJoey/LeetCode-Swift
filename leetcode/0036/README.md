# 36. [Valid Sudoku](https://leetcode.com/problems/valid-sudoku)

## Question

Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated **according to the following rules**:

1. Each row must contain the digits `1-9` without repetition.
2. Each column must contain the digits `1-9` without repetition.
3. Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

**Note:**

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

**Example 1:**

![img](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2021/04/12/250px-sudoku-by-l2g-20050714svg.png)

```
Input: board = 
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: true
```

**Example 2:**

```
Input: board = 
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]
Output: false
Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
```

## [有效的数独](https://leetcode-cn.com/problems/valid-sudoku)

请你判断一个 9x9 的数独是否有效。只需要 根据以下规则 ，验证已经填入的数字是否有效即可。

1. 数字 1-9 在每一行只能出现一次。
2. 数字 1-9 在每一列只能出现一次。
3. 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。（请参考示例图）

数独部分空格内已填入了数字，空白格用 '.' 表示。

注意：

- 一个有效的数独（部分已被填充）不一定是可解的。
- 只需要根据以上规则，验证已经填入的数字是否有效即可。

## 解题思路

一次迭代分别枚举行、列、子数独；用哈希表存储已经遇到的值。

## 代码实现

### Swift

```swift
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
```

### Python

```python
def isValidSudoku(board: [[str]]):
    rows = [{} for i in range(9)]
    columns = [{} for i in range(9)]
    boxes = [{} for i in range(9)]

    for i in range(9):
        for j in range(9):
            num = board[i][j]
            if num != '.':
                num = int(num)
                box_index = (i // 3 ) * 3 + j // 3
                
                rows[i][num] = rows[i].get(num, 0) + 1
                columns[j][num] = columns[j].get(num, 0) + 1
                boxes[box_index][num] = boxes[box_index].get(num, 0) + 1
                
                if rows[i][num] > 1 or columns[j][num] > 1 or boxes[box_index][num] > 1:
                    return False         
    return True
```

## 复杂度分析

- 时间复杂度：O(1)
- 空间复杂度：O(1)