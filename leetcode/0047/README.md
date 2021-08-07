# 47. [Permutations II](https://leetcode.com/problems/permutations-ii)

## Question

Given a collection of numbers, `nums`, that might contain duplicates, return *all possible unique permutations **in any order**.* 

**Example 1:**

```
Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
```

**Example 2:**

```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

**Constraints:**

- `1 <= nums.length <= 8`
- `-10 <= nums[i] <= 10`

## [全排列 II](https://leetcode-cn.com/problems/permutations-ii)

给定一个可包含重复数字的序列 `nums` ，**按任意顺序** 返回所有不重复的全排列。

## 解题思路

排序+回溯+剪枝

## 代码实现

### Swift

```swift
var n: Int = 0
var list: [Int] = []
var result = [[Int]]()
var used = [Bool]()

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    list = nums.sorted()
    n = nums.count
    
    used = Array.init(repeating: false, count: n)
    backtrace(depath: 0, path: [])
    return result
}

func backtrace(depath: Int = 0, path: [Int]) {
    if depath == n {
        result.append(path)
    } else {
        var path = path
        for i in 0..<n {
            if used[i] || (i > 0 && list[i] == list[i-1] && !used[i-1]) {
                continue
            }
            used[i] = true
            path.append(list[i])
            backtrace(depath: depath + 1, path: path)
            used[i] = false
            path.popLast()
        }
    }
}

print(permuteUnique([1,1,2]))
```

### Python

```python
def permuteUnique(nums: [int]) -> [[int]]:
    def dfs(depth, path):
        if depth == size:
            res.append(path.copy())
            return
        for i in range(size):
            if used[i] or (i > 0 and nums[i] == nums[i - 1] and not used[i - 1]):
                continue

            used[i] = True
            path.append(nums[i])
            dfs(depth + 1, path)
            used[i] = False
            path.pop()

    size = len(nums)
    if size == 0: return []
    nums.sort()

    used = [False] * len(nums)
    res = []
    dfs(0, [])
    return res

print(permuteUnique([1,1,2]))
```

## 复杂度分析

- 时间复杂度：O(n*n!)
- 空间复杂度：O(n)