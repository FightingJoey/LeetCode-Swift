func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var fast = 1, slow = 1
    while fast < nums.count {
        if nums[fast] != nums[fast - 1] {
            nums[slow] = nums[fast]
            slow += 1
        }
        fast += 1
    }
    return slow
}

var nums = [0,0,1,1,1,2,2,3,3,4]
let num = removeDuplicates(&nums)
print(num)
