func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hash: Dictionary<Int, Int> = [:]
    for (i, num) in nums.enumerated() {
        if let lastIndex = hash[target - num] {
            return [lastIndex, i]
        }
        hash[num] = i
    }
    return []
}

let result = twoSum([2,7,11,15], 9)
print(result)
