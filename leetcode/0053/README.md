# 53. [Maximum Subarray](https://leetcode.com/problems/maximum-subarray)

## Question

Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return *its sum*.

A **subarray** is a **contiguous** part of an array.

**Example 1:**

```
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
```

**Example 2:**

```
Input: nums = [1]
Output: 1
```

**Example 3:**

```
Input: nums = [5,4,-1,7,8]
Output: 23
```

## [最大子序和](https://leetcode-cn.com/problems/maximum-subarray/)

给定一个整数数组 `nums` ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

## 解题思路

动态规划

## 代码实现

### Swift

```swift
func maxSubArray(_ nums: [Int]) -> Int {
    var pre = 0, maxAns = nums[0]
    for x in nums {
        pre = max(pre + x, x)
        maxAns = max(maxAns, pre)
    }
    return maxAns
}
```

### Python

```python
def maxSubArray(nums: [int]) -> int:
    pre = 0, maxAns = nums[0]
    for x in nums:
        pre = max(pre + x, x)
        maxAns = max(maxAns, pre)
    return maxAns
```

## 复杂度分析

- 时间复杂度：O(n)
- 空间复杂度：O(1)