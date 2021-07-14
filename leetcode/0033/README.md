# 33. [Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array)

## Question

There is an integer array `nums` sorted in ascending order (with **distinct** values).

Prior to being passed to your function, `nums` is **rotated** at an unknown pivot index `k` (`0 <= k < nums.length`) such that the resulting array is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]` (**0-indexed**). For example, `[0,1,2,4,5,6,7]` might be rotated at pivot index `3` and become `[4,5,6,7,0,1,2]`.

Given the array `nums` **after** the rotation and an integer `target`, return *the index of* `target` *if it is in* `nums`*, or* `-1` *if it is not in* `nums`.

You must write an algorithm with `O(log n)` runtime complexity.

**Example 1:**

```
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```

**Example 2:**

```
Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

**Example 3:**

```
Input: nums = [1], target = 0
Output: -1
```

**Constraints:**

- `1 <= nums.length <= 5000`
- `-104 <= nums[i] <= 104`
- All values of `nums` are **unique**.
- `nums` is guaranteed to be rotated at some pivot.
- `-104 <= target <= 104`

## [搜索旋转排序数组](https://leetcode-cn.com/problems/search-in-rotated-sorted-array)

整数数组 nums 按升序排列，数组中的值 互不相同 。

在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。

给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

## 解题思路

二分查找，虽然题目中数组本身不是有序的，但是仔细分析我们可以知道，如果我们将数组从中间分开成左右两部分的时候，一定有一部分的数组是有序的。拿示例来看，我们从 6 这个位置分开以后数组变成了 [4, 5, 6] 和 [7, 0, 1, 2] 两个部分，其中左边 [4, 5, 6] 这个部分的数组是有序的。

在实际操作是，我们查看以 mid 为分割线分割出来的两部分中，哪一部分是有序排列的，然后判断 target 在不在该部分中，不在的话，就去查看另一部分。

## 代码实现

### Swift

```swift
func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return -1
    }
    var left = 0, right = nums.count - 1
    while left <= right {
        let mid = (left + right) / 2
        
        if nums[mid] == target {
            return mid
        }
        if nums[0] <= nums[mid] {
            if nums[0] <= target && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if nums[mid] < target && target <= nums[nums.count - 1] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return -1
}
print(search([4,5,6,7,0,1,2], 0))
```

### Python

```python
def search(nums: [int], target: int) -> int:
    if not nums:
        return -1
    l, r = 0, len(nums) - 1
    while l <= r:
        mid = (l + r) // 2
        if nums[mid] == target:
            return mid
        if nums[0] <= nums[mid]:
            if nums[0] <= target < nums[mid]:
                r = mid - 1
            else:
                l = mid + 1
        else:
            if nums[mid] < target <= nums[len(nums) - 1]:
                l = mid + 1
            else:
                r = mid - 1
    return -1

print(search([4,5,6,7,0,1,2], 0))
```

## 复杂度分析

- 时间复杂度：*O*(log*n*)，即二分查找的时间复杂度
- 空间复杂度：O(1)