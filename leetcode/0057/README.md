# 57. [Insert Interval](https://leetcode.com/problems/insert-interval/)

## Question

You are given an array of non-overlapping intervals `intervals` where `intervals[i] = [starti, endi]` represent the start and the end of the `ith` interval and `intervals` is sorted in ascending order by `starti`. You are also given an interval `newInterval = [start, end]` that represents the start and end of another interval.

Insert `newInterval` into `intervals` such that `intervals` is still sorted in ascending order by `starti` and `intervals` still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return `intervals` *after the insertion*.

**Example 1:**

```
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
```

**Example 2:**

```
Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
```

**Example 3:**

```
Input: intervals = [], newInterval = [5,7]
Output: [[5,7]]
```

**Example 4:**

```
Input: intervals = [[1,5]], newInterval = [2,3]
Output: [[1,5]]
```

**Example 5:**

```
Input: intervals = [[1,5]], newInterval = [2,7]
Output: [[1,7]]
```

## [插入区间](https://leetcode-cn.com/problems/insert-interval/)

给你一个 **无重叠的** *，*按照区间起始端点排序的区间列表。

在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。

## 解题思路

![](https://tva1.sinaimg.cn/large/008i3skNly1gtlzbx8750j615m0k8t9y02.jpg)

## 代码实现

### Swift

```swift
func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var left = newInterval[0], right = newInterval[1]
    var placed = false
    var ans: [[Int]] = []
    for interval in intervals {
        let li = interval[0]
        let ri = interval[1]
        if li > right {
            if !placed {
                ans.append([left, right])
                placed = true
            }
            ans.append(interval)
        }
        else if ri < left {
            ans.append(interval)
        }
        else {
            left = min(left, li)
            right = max(right, ri)
        }
    }
    if !placed {
        ans.append([left, right])
    }
    return ans
}
```

### Python

```python
def insert(intervals: [[int]], newInterval: [int]) -> [[int]]:
    left, right = newInterval
    placed = False
    ans = list()
    for li, ri in intervals:
        if li > right:
            # 在插入区间的右侧且无交集
            if not placed:
                ans.append([left, right])
                placed = True
            ans.append([li, ri])
        elif ri < left:
            # 在插入区间的左侧且无交集
            ans.append([li, ri])
        else:
            # 与插入区间有交集，计算它们的并集
            left = min(left, li)
            right = max(right, ri)
    
    if not placed:
        ans.append([left, right])
    return ans
```

## 复杂度分析

- 时间复杂度：O(n)
- 空间复杂度：O(1)

