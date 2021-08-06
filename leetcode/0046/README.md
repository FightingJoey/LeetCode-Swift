# 46. [Permutations](https://leetcode.com/problems/permutations)

## Question

Given an array `nums` of distinct integers, return *all the possible permutations*. You can return the answer in **any order**.

**Example 1:**

```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

**Example 2:**

```
Input: nums = [0,1]
Output: [[0,1],[1,0]]
```

**Example 3:**

```
Input: nums = [1]
Output: [[1]]
```

**Constraints:**

- `1 <= nums.length <= 6`
- `-10 <= nums[i] <= 10`
- All the integers of `nums` are **unique**.

## [全排列](https://leetcode-cn.com/problems/permutations)

给定一个不含重复数字的数组 `nums` ，返回其 **所有可能的全排列** 。你可以 **按任意顺序** 返回答案。

## 解题思路

[回溯法](https://leetcode-cn.com/problems/permutations/solution/quan-pai-lie-by-leetcode-solution-2/)

## 代码实现

### Swift

```swift
var n: Int = 0
var list: [Int] = []
func permute(_ nums: [Int]) -> [[Int]] {
    list = nums
    n = nums.count
    var result = [[Int]]()
    backtrace(result: &result)
    return result
}

func backtrace(first: Int = 0, result: inout [[Int]]) {
    if first == n {
        result.append(list)
    } else {
        for i in first..<n {
            list.swapAt(first, i)
            backtrace(first: first + 1, result: &result)
            list.swapAt(first, i)
        }
    }
}

print(permute([1,2,3]))
```

### Python

```python
def permute(nums):
    def backtrack(first = 0):
        # 所有数都填完了
        if first == n:
            res.append(nums[:])
        for i in range(first, n):
            # 动态维护数组
            nums[first], nums[i] = nums[i], nums[first]
            # 继续递归填下一个数
            backtrack(first + 1)
            # 撤销操作
            nums[first], nums[i] = nums[i], nums[first]
    
    n = len(nums)
    res = []
    backtrack()
    return res
print(permute([1,2,3]))
```

## 复杂度分析

- 时间复杂度：*O*(n×n!)，其中 n 为序列的长度。
- 空间复杂度：*O*(n)