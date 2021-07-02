# 15. [3Sum](https://leetcode.com/problems/3sum)

## Question

Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

Notice that the solution set must not contain duplicate triplets.

**Example 1:**

```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
```

**Example 2:**

```
Input: nums = []
Output: []
```

**Example 3:**

```
Input: nums = [0]
Output: []
```

**Constraints:**

- `0 <= nums.length <= 3000`
- `-105 <= nums[i] <= 105`

## [三数之和](https://leetcode-cn.com/problems/3sum)

给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。

注意：答案中不可以包含重复的三元组。

## 解题思路

排序+双指针法，当我们需要枚举数组中的两个元素时，如果我们发现随着第一个元素的递增，第二个元素是递减的，那么就可以使用双指针的方法。

## 代码实现

### Swift

```swift
func threeSum(_ nums: [Int]) -> [[Int]] {
    // 首先判断边界
    guard nums.count > 2 else { return [] }

    var result = [[Int]]()
    let nums = nums.sorted()

    for i in 0..<nums.count {
      	// 如果最左边的值大于零，就不会有和为0的三元组了
        if nums[i] > 0 {
            break
        }
        var left = i + 1
        var right = nums.count - 1

        if i > 0 && nums[i] == nums[i - 1]  {
            // 过滤重复的数值
            continue
        }
        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            if sum == 0 {
                result.append([nums[i], nums[left], nums[right]])
                while left < right && nums[left] == nums[left + 1] {
                    left += 1
                }
                while left < right && nums[right] == nums[right - 1] {
                    right -= 1
                }
              	left += 1
              	right -= 1
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
    }
    return result
}
```

### Python

```python
def threeSum(nums: [int]) -> [[int]]:
    n=len(nums)
    if(not nums or n<3):
        return []
    nums.sort()
    res=[]
    for first in range(n):
        if(nums[first]>0):
            return res
        if(first>0 and nums[first]==nums[first-1]):
            continue
        second=first+1
        three=n-1
        while(second<three):
            s = nums[first]+nums[second]+nums[three]
            if(s==0):
                res.append([nums[first],nums[second],nums[three]])
                while(second<three and nums[second]==nums[second+1]):
                    second=second+1
                while(second<three and nums[three]==nums[three-1]):
                    three=three-1
                second=second+1
                three=three-1
            elif(s>0):
                three=three-1
            else:
                second=second+1
    return res

print(threeSum([-1,0,1,2,-1,-4]))
```

## 复杂度分析

- 时间复杂度：O(n2)
- 空间复杂度：O(1)

