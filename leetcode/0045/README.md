# 45. [Jump Game II](https://leetcode.com/problems/jump-game-ii)

## Question

Given an array of non-negative integers `nums`, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Your goal is to reach the last index in the minimum number of jumps.

You can assume that you can always reach the last index.

**Example 1:**

```
Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

**Example 2:**

```
Input: nums = [2,3,0,1,4]
Output: 2
```

**Constraints:**

- `1 <= nums.length <= 104`
- `0 <= nums[i] <= 1000`

## [跳跃游戏 II](https://leetcode-cn.com/problems/jump-game-ii)

给你一个非负整数数组 nums ，你最初位于数组的第一个位置。

数组中的每个元素代表你在该位置可以跳跃的最大长度。

你的目标是使用最少的跳跃次数到达数组的最后一个位置。

假设你总是可以到达数组的最后一个位置。

## 解题思路

正向查找+贪心算法，每次找到可到达的最远位置，就可以在线性时间内得到最少的跳跃次数。

在具体的实现中，我们维护当前能够到达的最大下标位置，记为边界。我们从左到右遍历数组，到达边界时，更新边界并将跳跃次数增加 1。

在遍历数组时，我们不访问最后一个元素，这是因为在访问最后一个元素之前，我们的边界一定大于等于最后一个位置，否则就无法跳到最后一个位置了。如果访问最后一个元素，在边界正好为最后一个位置的情况下，我们会增加一次「不必要的跳跃次数」，因此我们不必访问最后一个元素。

## 代码实现

### Swift

```swift
func jump(_ nums: [Int]) -> Int {
    let n = nums.count
    var maxPos = 0, end = 0, step = 0
    for i in 0..<n-1 {
        if maxPos >= i {
            maxPos = max(maxPos, i+nums[i])
            if i == end {
                end = maxPos
                step += 1
            }
        }
    }
    return step
}
jump([2,3,1,2,4,2,3])
```

### Python

```python
def jump(nums: [int]) -> int:
    n = len(nums)
    maxPos, end, step = 0, 0, 0
    for i in range(n - 1):
        if maxPos >= i:
            maxPos = max(maxPos, i + nums[i])
            if i == end:
                end = maxPos
                step += 1
    return step

jump([2,3,1,2,4,2,3])
```

## 复杂度分析

- 时间复杂度：O(n)
- 空间复杂度：O(1)