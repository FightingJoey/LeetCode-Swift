func threeSum(_ nums: [Int]) -> [[Int]] {
    // 首先判断边界
    guard nums.count > 2 else { return [] }

    var result = [[Int]]()
    let nums = nums.sorted()

    for i in 0..<nums.count {
          // 如果最左边的值大于零，就不会有和为0的三元组了
        if nums[i] > 0 {
            break
        }
        var left = i + 1
        var right = nums.count - 1

        if i > 0 && nums[i] == nums[i - 1]  {
            // 过滤重复的数值
            continue
        }
        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            if sum == 0 {
                result.append([nums[i], nums[left], nums[right]])
                while left < right && nums[left] == nums[left + 1] {
                    left += 1
                }
                while left < right && nums[right] == nums[right - 1] {
                    right -= 1
                }
                left += 1
                right -= 1
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
    }
    return result
}
