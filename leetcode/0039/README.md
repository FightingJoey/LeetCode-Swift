# 39. [Combination Sum](https://leetcode.com/problems/combination-sum)

## Question

Given an array of **distinct** integers `candidates` and a target integer `target`, return *a list of all **unique combinations** of* `candidates` *where the chosen numbers sum to* `target`*.* You may return the combinations in **any order**.

The **same** number may be chosen from `candidates` an **unlimited number of times**. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

It is **guaranteed** that the number of unique combinations that sum up to `target` is less than `150` combinations for the given input.

**Example 1:**

```
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
```

**Example 2:**

```
Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
```

**Example 3:**

```
Input: candidates = [2], target = 1
Output: []
```

**Example 4:**

```
Input: candidates = [1], target = 1
Output: [[1]]
```

**Example 5:**

```
Input: candidates = [1], target = 2
Output: [[1,1]] 
```

**Constraints:**

- `1 <= candidates.length <= 30`
- `1 <= candidates[i] <= 200`
- All elements of `candidates` are **distinct**.
- `1 <= target <= 500`

## [组合总和](https://leetcode-cn.com/problems/combination-sum)

给定一个无重复元素的正整数数组 candidates 和一个正整数 target ，找出 candidates 中所有可以使数字和为目标数 target 的唯一组合。

candidates 中的数字可以无限制重复被选取。如果至少一个所选数字数量不同，则两种组合是唯一的。 

对于给定的输入，保证和为 target 的唯一组合数少于 150 个。

## 解题思路

[回溯算法+剪枝](https://leetcode-cn.com/problems/combination-sum/solution/hui-su-suan-fa-jian-zhi-python-dai-ma-java-dai-m-2/)

## 代码实现

### Swift

```swift
var n = 0
var ans = [[Int]]()
var sortedCandidates = [Int]()
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
            if target - sortedCandidates[i] < 0 {
                break
            }
            cur.append(sortedCandidates[i])
            dfs(target-sortedCandidates[i], cur, i)
            cur.popLast()
        }
    }
}

print(combinationSum([2,3,6,7], 7))
```

### Python

```python
from typing import List
def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
    n = len(candidates)
    ans = []
    candidates.sort()
    def dfs(target,cur,begin):
        if target == 0:
            ans.append(cur[:])
        else:
            for i in range(begin,n):
                if target-candidates[i] < 0:
                    break
                cur.append(candidates[i])
                dfs(target-candidates[i],cur,i)
                cur.pop()
    dfs(target,[],0)
    return ans
```

## 复杂度分析

- 时间复杂度：
- 空间复杂度：