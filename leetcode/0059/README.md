# 59. [Spiral Matrix II](https://leetcode.com/problems/spiral-matrix-ii)

## Question

Given a positive integer `n`, generate an `n x n` `matrix` filled with elements from `1` to `n2` in spiral order.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2020/11/13/spiraln.jpg)

```
Input: n = 3
Output: [[1,2,3],[8,9,4],[7,6,5]]
```

**Example 2:**

```
Input: n = 1
Output: [[1]]
```

## [螺旋矩阵 II](https://leetcode-cn.com/problems/spiral-matrix-ii)

给你一个正整数 `n` ，生成一个包含 `1` 到 `n x n` 所有元素，且元素按顺时针顺序螺旋排列的 `n x n` 正方形矩阵 `matrix` 。

## 解题思路

将矩阵看成若干层，一层一层的赋值

## 代码实现

### Swift

```swift
func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
    var left = 0, right = n - 1, top = 0, bottom = n - 1
    var insertN = 1
    while left <= right && top <= bottom {
        for column in left..<right+1 {
            matrix[top][column] = insertN
            insertN += 1
        }
        for row in top+1..<bottom+1 {
            matrix[row][right] = insertN
            insertN += 1
        }
        if left < right && top < bottom {
            for column in stride(from: right-1, to: left, by: -1) {
                matrix[bottom][column] = insertN
                insertN += 1
            }
            for row in stride(from: bottom, to: top, by: -1) {
                matrix[row][left] = insertN
                insertN += 1
            }
        }
        left = left + 1
        right = right - 1
        top = top + 1
        bottom = bottom - 1
    }
    
    return matrix
}
print(generateMatrix(3))
```

### Python

```python
def generateMatrix(n: int) -> [[int]]:
	matrix = [[0 for _ in range(n)] for _ in range(n)]

	left, right, top, bottom = 0, n - 1, 0, n - 1
	insert_n = 1
	while left <= right and top <= bottom:
		for column in range(left, right+1):
			matrix[top][column] = insert_n
			insert_n += 1
		for row in range(top+1, bottom+1):
			matrix[row][right] = insert_n
			insert_n += 1
		if left < right and top < bottom:
			for column in range(right - 1, left, -1):
				matrix[bottom][column] = insert_n
				insert_n += 1
			for row in range(bottom, top, -1):
				matrix[row][left] = insert_n
				insert_n += 1
		left, right, top, bottom = left + 1, right - 1, top + 1, bottom - 1
	return matrix

print(generateMatrix(3))
```

## 复杂度分析

- 时间复杂度：O(n2)，矩阵中的每个元素都要被访问一次。
- 空间复杂度：O(1)