func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }
    var result = [[Int]]()
    let nums = nums.sorted()
    let length = nums.count
    for i in 0..<length-3 {
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target {
            break
        }
        if nums[i] + nums[length - 3] + nums[length - 2] + nums[length - 1] < target {
            continue
        }
        for j in i+1..<length-2 {
            if j > i + 1 && nums[j] == nums[j - 1] {
                continue
            }
            if nums[i] + nums[j] + nums[j + 1] + nums[j + 2] > target {
                break
            }
            if nums[i] + nums[j] + nums[length - 2] + nums[length - 1] < target {
                continue
            }
            var left = j + 1, right = length - 1
            while left < right {
                let total = nums[i] + nums[j] + nums[left] + nums[right]
                if total == target {
                    result.append([nums[i], nums[j], nums[left], nums[right]])
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    left += 1
                                            
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    right -= 1
                } else if total < target {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
    }
    return result
}
print(fourSum([1,0,-1,0,-2,2], 0))
