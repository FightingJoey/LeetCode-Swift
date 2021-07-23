func firstMissingPositive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 1
    }
    var hashTable = Set<Int>()
    let n = nums.count
    for num in nums {
        hashTable.insert(num)
    }
    for i in 1..<n {
        if !hashTable.contains(i) {
            return i
        }
    }
    return n + 1
}

func firstMissingPositive1(_ nums: [Int]) -> Int {
    let list = nums.sorted()
    var last = 0
    var num = 1
    for i in 0..<list.count {
        if num == list[i] {
            last = list[i]
            num += 1
        } else {
            if list[i] > 0 && list[i] != last {
                return num
            }
        }
    }
    return num
}

func firstMissingPositive2(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    // 遍历找到第一个突变的元素
    var pre = 0;
    for i in 0..<nums.count {
        if (nums[i] <= 0 || nums[i] == pre) {
            continue;  // 跳过非正整数和重复值
        } else if (nums[i] > pre + 1) {
            break;  // 找到第一个突变的元素
        }
        pre += 1;  // nums[i] == pre + 1
    }
    return pre + 1;
}

// 置换
func firstMissingPositive3(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 1
    }
    var nums = nums
    for i in 0..<nums.count {
        // 注意：nums[i] <= nums.count的判断要放在前边，防止数组越界
        while nums[i] > 0 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
            nums.swapAt(nums[i] - 1, i)
        }
    }
    for i in 0..<nums.count {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    return nums.count + 1
}

  // 打标记
  func firstMissingPositive4(_ nums: [Int]) -> Int {
    var nums = nums
    guard nums.count > 0 else {
        return 1
    }
    let n = nums.count
    nums = nums.map { (num) in
        num <= 0 ? n + 1 : num
    }
    for i in 0..<n {
        let num = abs(nums[i]);
        if (num <= n) {
            nums[num - 1] = -abs(nums[num - 1]);
        }
    }
    for i in 0..<n {
        if nums[i] > 0 {
            return i + 1
        }
    }
    return n + 1
}
