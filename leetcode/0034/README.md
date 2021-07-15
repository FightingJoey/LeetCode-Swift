# 34. [Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

## Question

Given an array of integers `nums` sorted in ascending order, find the starting and ending position of a given `target` value.

If `target` is not found in the array, return `[-1, -1]`.

You must write an algorithm with `O(log n)` runtime complexity. 

**Example 1:**

```
Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
```

**Example 2:**

```
Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]
```

**Example 3:**

```
Input: nums = [], target = 0
Output: [-1,-1]
```

**Constraints:**

- `0 <= nums.length <= 105`
- `-109 <= nums[i] <= 109`
- `nums` is a non-decreasing array.
- `-109 <= target <= 109`

## [在排序数组中查找元素的第一个和最后一个位置](https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 target，返回 [-1, -1]。

进阶：你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？

## 解题思路

单次二分查找，如果查到了，那么就从当前位置向前向后查询，直到确定首尾位置，但是这样在极端情况下，会导致时间复杂度为 O(n)，即数组中的所有元素都是目标元素。

两次二分查找确定双边界，寻找 leftIndex 即为在数组中寻找第一个大于等于 target 的下标，寻找 rigntIndex 即为在数组中寻找第一个大于 target 的下标，然后将下标减一。

## 代码实现

### Swift

```swift
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    var left = 0, right = nums.count
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] == target {
            var result = [Int]()
            var temp = mid
            while temp-1 >= 0 && nums[temp] == nums[temp - 1] {
                temp -= 1
            }
            result.append(temp)
            temp = mid
            while temp+1 < nums.count && nums[temp] == nums[temp + 1] {
                temp += 1
            }
            result.append(temp)
            return result
        }
        if nums[left] <= target && target < nums[mid] {
           right = mid + 1
        } else if nums[mid] < target && target <= nums[right] {
            left = mid - 1
        } else {
            return [-1, -1]
        }
    }
    return [-1, -1]
}

func binarySearch(_ nums: [Int], _ target: Int, _ lower: Bool) -> Int {
    var left = 0, right = nums.count-1, ans = nums.count
    while left <= right {
        let mid = (left + right) / 2
        if nums[mid] > target || (lower && nums[mid] == target) {
            right = mid - 1
            ans = mid
        } else {
            left = mid + 1
        }
    }
    return ans
}

func searchRange2(_ nums: [Int], _ target: Int) -> [Int] {
    let leftIndex = binarySearch(nums, target, true)
    let rightIndex = binarySearch(nums, target, false)
    if leftIndex <= rightIndex && rightIndex < nums.count && nums[leftIndex] == target && nums[rightIndex] == target {
        return [leftIndex, rightIndex]
    } else {
        return [-1, -1]
    }
}
```

### Python

```python
def searchRange(nums: [int], target: int) -> [int]:
	if not nums:
		return [-1, -1]
	left, right = 0, len(nums)-1
	while left <= right:
		mid = (left + right) // 2
		if nums[mid] == target:
			result = []
			temp = mid
			while temp-1 >= 0 and nums[temp] == nums[temp - 1]:
				temp -= 1
			result.append(temp)
			temp = mid
			while temp+1 <= len(nums)-1 and nums[temp] == nums[temp+1]:
				temp += 1
			result.append(temp)
			return result
		if nums[left] <= target < nums[mid]:
			right = mid - 1
		elif nums[mid] < target <= nums[right]:
			left = mid + 1
		else:
			return [-1, -1]
	return [-1, -1]

def searchRange2(nums: [int], target: int) -> [int]:
	if not nums:
		return [-1, -1]
	def binarySearch(nums: [int], target: int, lower: bool):
		left, right, ans = 0, len(nums) - 1, len(nums)
		while left <= right:
			mid = (left + right) // 2
			if nums[mid] > target or (lower and nums[mid] == target):
				right = mid - 1
				ans = mid
			else:
				left = mid + 1
		return ans
	left_index = binarySearch(nums, target, True)
	right_index = binarySearch(nums, target, False) - 1
	if left_index <= right_index and right_index < len(nums) and nums[left_index] == target and nums[right_index] == target:
		return [left_index, right_index]
	return [-1, -1]

print(searchRange2([5,7,7,8,8,10], 7))
```

## 复杂度分析

- 时间复杂度：O(log *n*)
- 空间复杂度：O(1)

