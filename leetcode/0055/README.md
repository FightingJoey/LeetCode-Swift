# 55. [Jump Game](https://leetcode.com/problems/jump-game)

## Question

You are given an integer array `nums`. You are initially positioned at the array's **first index**, and each element in the array represents your maximum jump length at that position.

Return `true` *if you can reach the last index, or* `false` *otherwise*.

**Example 1:**

```
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

**Example 2:**

```
Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
```

## [跳跃游戏](https://leetcode-cn.com/problems/jump-game)

给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。

数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个下标。

## 解题思路

正向查找+贪心算法

## 代码实现

### Swift

```swift
func canJump(_ nums: [Int]) -> Bool {
  	guard nums.count > 1 else { return true }
    let n = nums.count
    var maxPos = 0
    for i in 0..<n-1 {
        if maxPos >= i {
            maxPos = max(maxPos, i+nums[i])
            if maxPos >= n-1 {
              	return true
            }
        }
    }
    return false
}
```

### Python

```python
def canJump(nums: [int]) -> bool:
	n = len(nums)
	if n == 1: return True
	maxPos = 0
	for i in range(n - 1):
		if maxPos >= i:
			maxPos = max(maxPos, i + nums[i])
			if maxPos >= n-1:
				return True
	return False
```

## 复杂度分析

- 时间复杂度：O(n)
- 空间复杂度：O(1)