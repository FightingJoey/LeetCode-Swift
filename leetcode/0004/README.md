# 4. [Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)

## Question

There are two sorted arrays **nums1** and **nums2** of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

You may assume **nums1** and **nums2** cannot be both empty.

**Example1:**

```
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
```

**Example2:**

```
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
```

**Example 3:**

```
Input: nums1 = [0,0], nums2 = [0,0]
Output: 0.00000
```

**Example 4:**

```
Input: nums1 = [], nums2 = [1]
Output: 1.00000
```

**Example 5:**

```
Input: nums1 = [2], nums2 = []
Output: 2.00000
```

**Constraints:**

- `nums1.length == m`
- `nums2.length == n`
- `0 <= m <= 1000`
- `0 <= n <= 1000`
- `1 <= m + n <= 2000`
- `-106 <= nums1[i], nums2[i] <= 106`

## [中文题目](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/)

给定两个大小分别为 `m` 和 `n` 的正序（从小到大）数组 `nums1` 和 `nums2`。请你找出并返回这两个正序数组的 **中位数** 。

**进阶：**你能设计一个时间复杂度为 `O(log (m+n))` 的算法解决此问题吗？

## 解题思路

1. 使用归并的方式，合并两个有序数组，得到一个大的有序数组。大的有序数组的中间位置的元素，即为中位数。

2. 不需要合并两个有序数组，只要找到中位数的位置即可。由于两个数组的长度已知，因此中位数对应的两个数组的下标之和也是已知的。维护两个指针，初始时分别指向两个数组的下标 00 的位置，每次将指向较小值的指针后移一位（如果一个指针已经到达数组末尾，则只需要移动另一个数组的指针），直到到达中位数的位置。
3. [二分查找](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution/xun-zhao-liang-ge-you-xu-shu-zu-de-zhong-wei-s-114/)
4. [划分数组](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution/xun-zhao-liang-ge-you-xu-shu-zu-de-zhong-wei-s-114/)

## 代码实现

### 二分查找

```swift
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let m = nums1.count
    let n = nums2.count
    let total = m + n
    
    if total % 2 == 1 {
        let midIndex = total / 2
        let median = getKthElement(nums1, nums2, midIndex + 1)
        return median
    } else {
        let midIndex1 = total / 2 - 1
        let midIndex2 = total / 2
        let median = (getKthElement(nums1, nums2, midIndex1 + 1) + getKthElement(nums1, nums2, midIndex2 + 1)) / 2.0
        return median
    }
}

func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Double {
    /* 主要思路：要找到第 k (k>1) 小的元素，那么就取 pivot1 = nums1[k/2-1] 和 pivot2 = nums2[k/2-1] 进行比较
     * 这里的 "/" 表示整除
     * nums1 中小于等于 pivot1 的元素有 nums1[0 .. k/2-2] 共计 k/2-1 个
     * nums2 中小于等于 pivot2 的元素有 nums2[0 .. k/2-2] 共计 k/2-1 个
     * 取 pivot = min(pivot1, pivot2)，两个数组中小于等于 pivot 的元素共计不会超过 (k/2-1) + (k/2-1) <= k-2 个
     * 这样 pivot 本身最大也只能是第 k-1 小的元素
     * 如果 pivot = pivot1，那么 nums1[0 .. k/2-1] 都不可能是第 k 小的元素。把这些元素全部 "删除"，剩下的作为新的 nums1 数组
     * 如果 pivot = pivot2，那么 nums2[0 .. k/2-1] 都不可能是第 k 小的元素。把这些元素全部 "删除"，剩下的作为新的 nums2 数组
     * 由于我们 "删除" 了一些元素（这些元素都比第 k 小的元素要小），因此需要修改 k 的值，减去删除的数的个数
     */
    let length1 = nums1.count, length2 = nums2.count;
    var index1 = 0, index2 = 0;
    var k = k

    while true {
        // 边界情况
        if index1 == length1 {
            return Double(nums2[index2 + k - 1])
        }
        if index2 == length2 {
            return Double(nums1[index1 + k - 1])
        }
        if k == 1 {
            return Double([nums1[index1], nums2[index2]].min()!)
        }
        
        // 正常情况
        let half = k / 2;
        let newIndex1 = [index1 + half, length1].min()! - 1;
        let newIndex2 = [index2 + half, length2].min()! - 1;
        let pivot1 = nums1[newIndex1], pivot2 = nums2[newIndex2];
        if (pivot1 <= pivot2) {
            k -= (newIndex1 - index1 + 1);
            index1 = newIndex1 + 1;
        } else {
            k -= (newIndex2 - index2 + 1);
            index2 = newIndex2 + 1;
        }
    }
}
```

### 划分数组

```swift
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    if nums1.count > nums2.count {
        return findMedianSortedArrays(nums2, nums1)
    }

    let m = nums1.count
    let n = nums2.count
    var left = 0, right = m
    // median1：前一部分的最大值
    // median2：后一部分的最小值
    var median1 = 0, median2 = 0

    while left <= right {
        let i = (left + right) / 2
        let j = (m + n + 1) / 2 - i
        
        let nums_im1 = (i == 0 ? Int.min : nums1[i - 1])
        let nums_i = (i == m ? Int.max : nums1[i])
        let nums_jm1 = (j == 0 ? Int.min : nums2[j - 1])
        let nums_j = (j == n ? Int.max : nums2[j])
        
        if nums_im1 <= nums_j {
            median1 = [nums_im1, nums_jm1].max()!
            median2 = [nums_i, nums_j].min()!
            left = i + 1
        } else {
            right = i - 1
        }
    }

    return (m + n) % 2 == 0 ? Double(median1 + median2) / 2.0 : Double(median1)
}
```

## 复杂度分析

### 归并及双指针

时间复杂度：O(m+n)

空间复杂度：O(m+n)

### 二分查找

时间复杂度：O(log(m+n))，其中 m 和 n 分别是数组 nums1 和 nums2 的长度。初始时有 k=(m+n)/2 或 k=(m+n)/2+1，每一轮循环可以将查找范围减少一半，因此时间复杂度是 O(log(m+n))。

空间复杂度：O(1)。

### 划分数组

时间复杂度：O(log min(m,n))

空间复杂度：O(1)。

