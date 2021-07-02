# 1.Two Sum
## Question

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

**Example:**

```
Given nums = [2, 7, 11, 15], target = 9,
Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

## 中文题目

给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

## 解题思路

使用哈希表，可以将寻找 `target - x` 的时间复杂度降低到从 O(N)降低到 O(1)。

创建一个哈希表，对于每一个 `x`，我们首先查询哈希表中是否存在 `target - x`，如果存在，则直接返回，如果不存在，则以  `target - x` 作为 key，x 作为 value 存储到哈希表中。

## 代码实现

### Swift

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hash: Dictionary<Int, Int> = [:]
    for (i, num) in nums.enumerated() {
        if let lastIndex = hash[target - num] {
            return [lastIndex, i]
        }
        hash[num] = i
    }
    return []
}
```

### Python

```python
# -*- coding: utf-8 -*-
def twoSum(nums, target):
    hashTable={}
    for i,num in enumerate(nums):
        if hashTable.get(target - num) is not None:
            return [hashTable.get(target - num), i]
        hashTable[num] = i

result = twoSum([2,7,11,15], 9)
print(result)
```

## 复杂度分析

- 时间复杂度：O(N)，其中 N 是数组中的元素数量。对于每一个元素 x，我们可以 O(1) 地寻找 target - x。

- 空间复杂度：O(N)，其中 N 是数组中的元素数量。主要为哈希表的开销。
