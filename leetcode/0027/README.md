# 27. [Remove Element](https://leetcode.com/problems/remove-element)

## Question

Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm). The relative order of the elements may be changed.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the **first part** of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.

Return `k` *after placing the final result in the first* `k` *slots of* `nums`.

Do **not** allocate extra space for another array. You must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.

**Custom Judge:**

The judge will test your solution with the following code:

```
int[] nums = [...]; // Input array
int val = ...; // Value to remove
int[] expectedNums = [...]; // The expected answer with correct length.
                            // It is sorted with no values equaling val.

int k = removeElement(nums, val); // Calls your implementation

assert k == expectedNums.length;
sort(nums, 0, k); // Sort the first k elements of nums
for (int i = 0; i < actualLength; i++) {
    assert nums[i] == expectedNums[i];
}
```

If all assertions pass, then your solution will be **accepted**.

**Example 1:**

```
Input: nums = [3,2,2,3], val = 3
Output: 2, nums = [2,2,_,_]
Explanation: Your function should return k = 2, with the first two elements of nums being 2.
It does not matter what you leave beyond the returned k (hence they are underscores).
```

**Example 2:**

```
Input: nums = [0,1,2,2,3,0,4,2], val = 2
Output: 5, nums = [0,1,4,0,3,_,_,_]
Explanation: Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
Note that the five elements can be returned in any order.
It does not matter what you leave beyond the returned k (hence they are underscores). 
```

**Constraints:**

- `0 <= nums.length <= 100`
- `0 <= nums[i] <= 50`
- `0 <= val <= 100`

## [移除元素](https://leetcode-cn.com/problems/remove-element)

给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

## 解题思路

双指针，左右指针分别指向两端，判断左指针指向的元素是否等于val，是的话，将右指针指向的元素复制到左指针指向的位置，然后右指针向左移动一位，否则左指针向右移动一位。

## 代码实现

### Swift

```swift
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var left = 0, right = nums.count
    while left < right {
        if nums[left] == val {
            nums[left] = nums[right-1]
            right -= 1
        } else {
            left += 1
        }
    }
    return left
}
```

### Python

```python
def removeElement(nums: [int], val: int) -> int:
    left = 0
    right = len(nums)
    
    while left < right:
        if nums[left] == val:
            nums[left] = nums[right-1]
            right -= 1
        else:
            left += 1

    return left

print(removeElement([0,0,1,1,1,2,2,3,3,4], 3))
```

## 复杂度分析

- 时间复杂度：O(n)，其中 n 为序列的长度
- 空间复杂度：O(1)