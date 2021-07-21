# 40. [Combination Sum II](https://leetcode.com/problems/combination-sum-ii)

## Question

Given a collection of candidate numbers (`candidates`) and a target number (`target`), find all unique combinations in `candidates` where the candidate numbers sum to `target`.

Each number in `candidates` may only be used **once** in the combination.

**Note:** The solution set must not contain duplicate combinations.

**Example 1:**

```
Input: candidates = [10,1,2,7,6,1,5], target = 8
Output: 
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
```

**Example 2:**

```
Input: candidates = [2,5,2,1,2], target = 5
Output: 
[
[1,2,2],
[5]
] 
```

**Constraints:**

- `1 <= candidates.length <= 100`
- `1 <= candidates[i] <= 50`
- `1 <= target <= 30`

## [组合总和 II](https://leetcode-cn.com/problems/combination-sum-ii)

给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

candidates 中的每个数字在每个组合中只能使用一次。

注意：解集不能包含重复的组合。 

## 解题思路

[回溯+剪枝]()

## 代码实现

### Swift

```swift
var n = 0
var ans = [[Int]]()
var sortedCandidates = [Int]()
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    n = candidates.count
    ans = [[Int]]()
    sortedCandidates = candidates.sorted()
    
    dfs(target, [], 0)
    
    return ans
}

func dfs(_ target: Int, _ cur: [Int], _ begin: Int) {
    var cur = cur
    if target == 0 {
        ans.append(cur)
    } else {
        for i in begin..<n {
            if sortedCandidates[i] > target {
                break
            }
            if i > begin && sortedCandidates[i - 1] == sortedCandidates[i] {
                continue
            }
            cur.append(sortedCandidates[i])
            dfs(target-sortedCandidates[i], cur, i+1)
            cur.popLast()
        }
    }
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
```

### Python

```python
from typing import List
def combinationSum2(candidates: List[int], target: int) -> List[List[int]]:
    def dfs(begin, cur, target):
        if target == 0:
            res.append(cur[:])
            return

        for index in range(begin, size):
            if candidates[index] > target:
                break

            if index > begin and candidates[index - 1] == candidates[index]:
                continue

            cur.append(candidates[index])
            dfs(index + 1, cur, target - candidates[index])
            cur.pop()

    size = len(candidates)
    if size == 0:
        return []

    candidates.sort()
    res = []
    dfs(0, [], target)
    return res

print(combinationSum2([10,1,2,7,6,1,5], 8))
```

## 复杂度分析

- 时间复杂度：
- 空间复杂度：

