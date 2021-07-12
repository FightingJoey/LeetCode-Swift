# 31. [Next Permutation](https://leetcode.com/problems/next-permutation)

## Question

Implement **next permutation**, which rearranges numbers into the lexicographically next greater permutation of numbers.

If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).

The replacement must be **[in place](http://en.wikipedia.org/wiki/In-place_algorithm)** and use only constant extra memory.

**Example 1:**

```
Input: nums = [1,2,3]
Output: [1,3,2]
```

**Example 2:**

```
Input: nums = [3,2,1]
Output: [1,2,3]
```

**Example 3:**

```
Input: nums = [1,1,5]
Output: [1,5,1]
```

**Example 4:**

```
Input: nums = [1]
Output: [1]
```

**Constraints:**

- `1 <= nums.length <= 100`
- `0 <= nums[i] <= 100`

## [下一个排列](https://leetcode-cn.com/problems/next-permutation)

实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。

如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。

必须 原地 修改，只允许使用额外常数空间。

## 解题思路

[下一个排列算法详解：思路+推导+步骤，看不懂算我输！](https://leetcode-cn.com/problems/next-permutation/solution/xia-yi-ge-pai-lie-suan-fa-xiang-jie-si-lu-tui-dao-/)

## 代码实现

### Swift

```swift
func nextPermutation(_ nums: inout [Int]) {
    if nums.count < 2 {
        return
    }
    var i = nums.count - 2
    while i >= 0 && nums[i] >= nums[i + 1] {
        i -= 1
    }
    if i >= 0 {
        var j = nums.count - 1
        while j >= 0 && nums[i] >= nums[j] {
            j -= 1
        }
        (nums[i], nums[j]) = (nums[j], nums[i])
    }

    var left = i + 1, right = nums.count - 1
    while left < right {
        (nums[left], nums[right]) = (nums[right], nums[left])
        left += 1
        right -= 1
    }
}

var nums = [1, 2, 3]
nextPermutation(&nums)
print(nums)
```

### Python

```python
def nextPermutation(nums: [int]) -> None:
    i = len(nums) - 2
    while i >= 0 and nums[i] >= nums[i + 1]:
        i -= 1
    if i >= 0:
        j = len(nums) - 1
        while j >= 0 and nums[i] >= nums[j]:
            j -= 1
        nums[i], nums[j] = nums[j], nums[i]
    
    left, right = i + 1, len(nums) - 1
    while left < right:
        nums[left], nums[right] = nums[right], nums[left]
        left += 1
        right -= 1
```

## 复杂度分析

- 时间复杂度：O(n)，其中 n 为给定序列的长度。我们至多只需要扫描两次序列，以及进行一次反转操作。
- 空间复杂度：O(1)