# 18. [4Sum](https://leetcode.com/problems/4sum)

## Question

Given an array `nums` of `n` integers, return *an array of all the **unique** quadruplets* `[nums[a], nums[b], nums[c], nums[d]]` such that:

- `0 <= a, b, c, d < n`
- `a`, `b`, `c`, and `d` are **distinct**.
- `nums[a] + nums[b] + nums[c] + nums[d] == target`

You may return the answer in **any order**.

**Example 1:**

```
Input: nums = [1,0,-1,0,-2,2], target = 0
Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
```

**Example 2:**

```
Input: nums = [2,2,2,2,2], target = 8
Output: [[2,2,2,2]]
```

**Constraints:**

- `1 <= nums.length <= 200`
- `-109 <= nums[i] <= 109`
- `-109 <= target <= 109`

## [四数之和](https://leetcode-cn.com/problems/4sum/)

给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

注意：答案中不可以包含重复的四元组。

## 解题思路

排序+双指针

## 代码实现

### Swift

```swift
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }
    var result = [[Int]]()
    let nums = nums.sorted()
    let length = nums.count
    for i in 0..<length-3 {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target {
            break
        }
        if nums[i] + nums[length - 3] + nums[length - 2] + nums[length - 1] < target {
            continue
        }
        for j in i+1..<length-2 {
            if j > i + 1 && nums[j] == nums[j - 1] {
                continue
            }
            if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target {
                break
            }
            if nums[i] + nums[j] + nums[length - 2] + nums[length - 1] < target {
                continue
            }
            var left = j + 1, right = length - 1
            while left < right {
                let total = nums[i] + nums[j] + nums[left] + nums[right]
                if total == target {
                    result.append([nums[i], nums[j], nums[left], nums[right]])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    left += 1
                                            
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    right -= 1
                } else if total < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    return result
}
print(fourSum([1,0,-1,0,-2,2], 0))
```

### Python

```python
def fourSum(nums: [int], target: int) -> [[int]]:
    quadruplets = list()
    if not nums or len(nums) < 4:
        return quadruplets
    
    nums.sort()
    length = len(nums)
    for i in range(length - 3):
        if i > 0 and nums[i] == nums[i - 1]:
            continue
        if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target:
            break
        if nums[i] + nums[length - 3] + nums[length - 2] + nums[length - 1] < target:
            continue
        for j in range(i + 1, length - 2):
            if j > i + 1 and nums[j] == nums[j - 1]:
                continue
            if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target:
                break
            if nums[i] + nums[j] + nums[length - 2] + nums[length - 1] < target:
                continue
            left, right = j + 1, length - 1
            while left < right:
                total = nums[i] + nums[j] + nums[left] + nums[right]
                if total == target:
                    quadruplets.append([nums[i], nums[j], nums[left], nums[right]])
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1
                    left += 1
                    while left < right and nums[right] == nums[right - 1]:
                        right -= 1
                    right -= 1
                elif total < target:
                    left += 1
                else:
                    right -= 1
    
    return quadruplets

print(fourSum([1,0,-1,0,-2,2], 0))
```

## 复杂度分析

- 时间复杂度：O(N3)
- 空间复杂度：O(N)