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

func findMedianSortedArrays2(_ nums1: [Int], _ nums2: [Int]) -> Double {
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
