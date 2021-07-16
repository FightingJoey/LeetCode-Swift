func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    if target < nums[0] {
        return 0
    }
    if target > nums[nums.count - 1] {
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
