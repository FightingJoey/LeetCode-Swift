# 11. [Container With Most Water](https://leetcode.com/problems/container-with-most-water/)

## Question

Given `n` non-negative integers `a1, a2, ..., an` , where each represents a point at coordinate `(i, ai)`. `n` vertical lines are drawn such that the two endpoints of the line `i` is at `(i, ai)` and `(i, 0)`. Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

**Notice** that you may not slant the container.

**Example 1:**

![img](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg)

```
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
```

**Example 2:**

```
Input: height = [1,1]
Output: 1
```

**Example 3:**

```
Input: height = [4,3,2,1,4]
Output: 16
```

**Example 4:**

```
Input: height = [1,2,1]
Output: 2
```

**Constraints:**

- `n == height.length`
- `2 <= n <= 105`
- `0 <= height[i] <= 104`

## [盛最多水的容器](https://leetcode-cn.com/problems/container-with-most-water)

给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器。

## 解题思路

双指针，开始时左右两指针 l 、r 分别指向数组的首位，作为容器的边界，`ans = max(ans, min(height[l], height[r]) * (l - r))`，之后我们每次将值较小的那个指针往另一个指针的方向移动一位，重复，直到两个指针重合

> 为什么要移动值较小的那个指针？

假设 `height[l] < height[r]`，如果把 r 向左移动得到 r'，那么 `min(Hl, Hr') <= min(Hl, Hr)`，但此时 `t' = r' - l` 也变小了，使得最后的结果肯定比 `min(Hl, Hr) * t `小。

## 代码实现

### Swift

```swift
func maxArea(_ height: [Int]) -> Int {
    var l = 0, r = height.count - 1
    var ans = 0
    while l < r {
        ans = max(ans, min(height[l], height[r]) * (l - r))
        if height[l] <= height[r] {
            l += 1
        }
        else {
            r -= 1
        }
    }
    return ans
}

print(maxArea([1,8,6,2,5,4,8,3,7]))
```

### Python

```python
def maxArea(height: [int]) -> int:
    l, r = 0, len(height) - 1
    ans = 0
    while l < r:
        area = min(height[l], height[r]) * (r - l)
        ans = max(ans, area)
        if height[l] <= height[r]:
            l += 1
        else:
            r -= 1
    return ans

print(maxArea([1,8,6,2,5,4,8,3,7]))
```

## 复杂度分析

- 时间复杂度：O(N)，双指针总计最多遍历整个数组一次。
- 空间复杂度：O(1)
