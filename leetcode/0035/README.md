# 35. [Search Insert Position](https://leetcode.com/problems/search-insert-position)

## Question

Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with `O(log n)` runtime complexity.

**Example 1:**

```
Input: nums = [1,3,5,6], target = 5
Output: 2
```

**Example 2:**

```
Input: nums = [1,3,5,6], target = 2
Output: 1
```

**Example 3:**

```
Input: nums = [1,3,5,6], target = 7
Output: 4
```

**Example 4:**

```
Input: nums = [1,3,5,6], target = 0
Output: 0
```

**Example 5:**

```
Input: nums = [1], target = 0
Output: 0
```

## [搜索插入位置](https://leetcode-cn.com/problems/search-insert-position)

给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

你可以假设数组中无重复元素。

## 解题思路

二分查找

## 代码实现

### Swift

```swift
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    if target <= nums[0] {
        return 0
    }
    if target >= nums[nums.count - 1] {
        return nums.count
    }
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] == target {
            return mid
        }
        if nums[left] <= target && target < nums[mid] {
            right = mid - 1
        }
        else if nums[mid] < target && target <= nums[right] {
            left = mid + 1
        }
        else {
            if target <= nums[left] {
                return left
            }
            if target >= nums[right] {
                return right + 1
            }
        }
    }
    return 0
}

print(searchInsert([1,2,4,6,7], 5))
```

### Python

```python
def searchInsert(nums: [int], target: int) -> int:
	if not nums:
		return 0
	if target < nums[0]:
		return 0
	if target > nums[len(nums) - 1]:
		return len(nums)
	left, right = 0, len(nums) - 1
	while left <= right:
		mid = (left + right) // 2
		if nums[mid] == target:
			return mid
		if nums[left] <= target < nums[mid]:
			right = mid - 1
		elif nums[mid] < target <= nums[right]:
			left = mid + 1
		else:
			if target <= nums[left]:
				return left
			if target >= nums[right]:
				return right + 1
	return 0

print(searchInsert([1,2,4,6,7], 5))
```

## 复杂度分析

- 时间复杂度：O(log *n*)
- 空间复杂度：O(1)