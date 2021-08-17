# 54. [Spiral Matrix](https://leetcode.com/problems/spiral-matrix)

## Question

Given an `m x n` `matrix`, return *all elements of the* `matrix` *in spiral order*.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2020/11/13/spiral1.jpg)

```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,3,6,9,8,7,4,5]
```

**Example 2:**

![img](https://assets.leetcode.com/uploads/2020/11/13/spiral.jpg)

```
Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
```

## [螺旋矩阵](https://leetcode-cn.com/problems/spiral-matrix/)

给你一个 `m` 行 `n` 列的矩阵 `matrix` ，请按照 **顺时针螺旋顺序** ，返回矩阵中的所有元素。

## 解题思路

可以将矩阵看成若干层，首先输出最外层的元素，其次输出次外层的元素，直到输出最内层的元素。

## 代码实现

### Swift

```swift
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count > 0 && matrix[0].count > 0  else {
        return []
    }
    let rows = matrix.count, columns = matrix[0].count
    var order = [Int]()
    var left = 0, right = columns - 1, top = 0, bottom = rows - 1
    while left <= right && top <= bottom {
        for column in left..<right+1 {
            order.append(matrix[top][column])
        }
        for row in top+1..<bottom+1 {
            order.append(matrix[row][right])
        }
        if left < right && top < bottom {
            for column in stride(from: right-1, to: left, by: -1) {
                order.append(matrix[bottom][column])
            }
            for row in stride(from: bottom, to: top, by: -1) {
                order.append(matrix[row][left])
            }
        }
        left = left + 1
        right = right - 1
        top = top + 1
        bottom = bottom - 1
    }
    return order
}
print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
```

### Python

```python
def spiralOrder(matrix: [[int]]) -> [int]:
    if not matrix or not matrix[0]:
        return list()
    
    rows, columns = len(matrix), len(matrix[0])
    order = list()
    left, right, top, bottom = 0, columns - 1, 0, rows - 1
    while left <= right and top <= bottom:
        for column in range(left, right + 1):
            order.append(matrix[top][column])
        for row in range(top + 1, bottom + 1):
            order.append(matrix[row][right])
        if left < right and top < bottom:
            for column in range(right - 1, left, -1):
                order.append(matrix[bottom][column])
            for row in range(bottom, top, -1):
                order.append(matrix[row][left])
        left, right, top, bottom = left + 1, right - 1, top + 1, bottom - 1
    return order

print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
```

## 复杂度分析

- 时间复杂度：O(mn)，其中 m 和 n 分别是输入矩阵的行数和列数。矩阵中的每个元素都要被访问一次。
- 空间复杂度：O(1)

