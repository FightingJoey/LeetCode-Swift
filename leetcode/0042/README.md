# 42. [Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water)

## Question

Given `n` non-negative integers representing an elevation map where the width of each bar is `1`, compute how much water it can trap after raining.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png)

```
Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
```

**Example 2:**

```
Input: height = [4,2,0,3,2,5]
Output: 9 
```

**Constraints:**

- `n == height.length`
- `0 <= n <= 3 * 104`
- `0 <= height[i] <= 105`

## [接雨水](https://leetcode-cn.com/problems/trapping-rain-water/)

给定 *n* 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

## 解题思路

![双指针](https://tva1.sinaimg.cn/large/008i3skNgy1gsqpv0mawdj318a0hwtd6.jpg)

## 代码实现

### Swift

```swift
func trap(_ height: [Int]) -> Int {
    var ans = 0
    var left = 0, right = height.count - 1, leftMax = 0, rightMax = 0
    while left < right {
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if leftMax < rightMax {
            ans += leftMax - height[left]
            left += 1
        } else {
            ans += rightMax - height[right]
            right -= 1
        }
    }
    return ans
}
```

### Python

```python
def trap(height: [int]) -> int:
    ans = 0
    left, right = 0, len(height) - 1
    leftMax = rightMax = 0

    while left < right:
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if leftMax < rightMax:
            ans += leftMax - height[left]
            left += 1
        else:
            ans += rightMax - height[right]
            right -= 1
    
    return ans
```

## 复杂度分析

- 时间复杂度：O(n)
- 空间复杂度：O(1)