# 16. [3Sum Closest](https://leetcode.com/problems/3sum-closest)

## Question

Given an array `nums` of *n* integers and an integer `target`, find three integers in `nums` such that the sum is closest to `target`. Return the sum of the three integers. You may assume that each input would have exactly one solution.

**Example 1:**

```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

**Constraints:**

- `3 <= nums.length <= 10^3`
- `-10^3 <= nums[i] <= 10^3`
- `-10^4 <= target <= 10^4`

## [最接近的三数之和](https://leetcode-cn.com/problems/3sum-closest)

给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

## 解题思路

排序+双指针，跟15题类似，只不过这次的目标是和与target最接近，那么怎么判断呢，用绝对值来判断。

首先对数组进行升序排序，之后使用两重循环来枚举所有可能的情况，枚举第一个元素 a，对于剩下的两个元素 b 和 c，我们希望它们的和最接近 target*−*a。

- 假设数组的长度为 n，我们先枚举 a，它在数组中的位置为 i；
- 为了防止重复枚举，我们在位置 [i+1,n) 的范围内枚举 b 和 c。
- 初始时，让 b 指向 i + 1，c 指向 n - 1，在每一步枚举的过程中，我们用 a+b+c 来更新答案，并且：
  - a + b + c >= target 时，把 c 向左移动一位
  - a + b + c < target 时，把 b 向右移动一位

### Swift

```swift
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 2 else { return 0 }
    
    let nums = nums.sorted()
    let n = nums.count
    var best = 10000000
    
    for i in 0..<n {
        if i > 0 && nums[i] == nums[i - 1]  {
            continue
        }
        var left = i + 1
        var right = n - 1

        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            if sum == target {
                return sum
            }
            update(cur: sum, best: &best, target: target)
            if sum > target {
                var temp = right - 1
                while left < temp && nums[temp] == nums[right] {
                    temp -= 1
                }
                right = temp
            } else {
                var temp = left + 1
                while temp < right && nums[temp] == nums[left] {
                    temp += 1
                }
                left = temp
            }
        }
    }
    
    return best
}

func update(cur: Int, best: inout Int, target: Int) {
    if abs(cur - target) < abs(best - target) {
        best = cur
    }
}

print(threeSumClosest([-1,0,1,2,-1,-4], 2))
```

### Python

```python
def threeSumClosest(nums: [int], target: int) -> int:
    nums.sort()
    n = len(nums)
    best = 10**7
    
    # 根据差值的绝对值来更新答案
    def update(cur):
        nonlocal best
        if abs(cur - target) < abs(best - target):
            best = cur
    
    # 枚举 a
    for i in range(n):
        # 保证和上一次枚举的元素不相等
        if i > 0 and nums[i] == nums[i - 1]:
            continue
        # 使用双指针枚举 b 和 c
        j, k = i + 1, n - 1
        while j < k:
            s = nums[i] + nums[j] + nums[k]
            # 如果和为 target 直接返回答案
            if s == target:
                return target
            update(s)
            if s > target:
                # 如果和大于 target，移动 c 对应的指针
                k0 = k - 1
                # 移动到下一个不相等的元素
                while j < k0 and nums[k0] == nums[k]:
                    k0 -= 1
                k = k0
            else:
                # 如果和小于 target，移动 b 对应的指针
                j0 = j + 1
                # 移动到下一个不相等的元素
                while j0 < k and nums[j0] == nums[j]:
                    j0 += 1
                j = j0

    return best

print(threeSumClosest([-1,0,1,2,-1,-4], 2))
```

## 复杂度分析

- 时间复杂度：O(N2)
- 空间复杂度：O(N)