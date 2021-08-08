# 48. [Rotate Image](https://leetcode.com/problems/rotate-image)

## Question

You are given an `n x n` 2D `matrix` representing an image, rotate the image by **90** degrees (clockwise).

You have to rotate the image [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm), which means you have to modify the input 2D matrix directly. **DO NOT** allocate another 2D matrix and do the rotation.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2020/08/28/mat1.jpg)

```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
```

**Example 2:**

![img](https://assets.leetcode.com/uploads/2020/08/28/mat2.jpg)

```
Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
```

**Example 3:**

```
Input: matrix = [[1]]
Output: [[1]]
```

**Example 4:**

```
Input: matrix = [[1,2],[3,4]]
Output: [[3,1],[4,2]]
```

## [旋转图像](https://leetcode-cn.com/problems/rotate-image)

给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。

## 解题思路

原地旋转、翻转

## 代码实现

### Swift

```swift
func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0..<n/2 {
        for j in 0..<(n+1)/2 {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[n - j - 1][i]
            matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
            matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1]
            matrix[j][n - i - 1] = temp
        }
    }
}

func rotate2(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0..<n/2 {
        for j in 0..<n {
            (matrix[i][j], matrix[n-1-i][j]) = (matrix[n-1-i][j], matrix[i][j])
        }
    }
    for i in 0..<n {
        for j in 0..<i {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
}

var m = [[1,2,3],[4,5,6],[7,8,9]]
rotate2(&m)
print(m)
```

### Python

```python
def rotate(matrix: [[int]]):
    n = len(matrix)
    for i in range(n // 2):
        for j in range((n + 1) // 2):
            matrix[i][j], matrix[n - j - 1][i], matrix[n - i - 1][n - j - 1], matrix[j][n - i - 1] \
                = matrix[n - j - 1][i], matrix[n - i - 1][n - j - 1], matrix[j][n - i - 1], matrix[i][j]

def rotate2(matrix: [[int]]):
    n = len(matrix)
    # 水平翻转
    for i in range(n // 2):
        for j in range(n):
            matrix[i][j], matrix[n - i - 1][j] = matrix[n - i - 1][j], matrix[i][j]
    # 主对角线翻转
    for i in range(n):
        for j in range(i):
            matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
```

## 复杂度分析

- 时间复杂度：O(N^2)，其中 N 是 matrix 的边长。
- 空间复杂度：O(1)。为原地旋转。