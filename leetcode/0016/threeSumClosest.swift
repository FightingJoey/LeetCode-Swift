func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 2 else { return 0 }
    
    let nums = nums.sorted()
    let n = nums.count
    var best = 10000000
    
    for i in 0..<n {
        if i > 0 && nums[i] == nums[i - 1]  {
            continue
        }
        var left = i + 1
        var right = n - 1

        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            if sum == target {
                return sum
            }
            update(cur: sum, best: &best, target: target)
            if sum > target {
                var temp = right - 1
                while left < temp && nums[temp] == nums[right] {
                    temp -= 1
                }
                right = temp
            } else {
                var temp = left + 1
                while temp < right && nums[temp] == nums[left] {
                    temp += 1
                }
                left = temp
            }
        }
    }
    
    return best
}

func update(cur: Int, best: inout Int, target: Int) {
    if abs(cur - target) < abs(best - target) {
        best = cur
    }
}

print(threeSumClosest([-1,0,1,2,-1,-4], 2))
