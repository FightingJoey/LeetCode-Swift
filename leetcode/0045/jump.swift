func jump(_ nums: [Int]) -> Int {
    let n = nums.count
    var maxPos = 0, end = 0, step = 0
    for i in 0..<n-1 {
        if maxPos >= i {
            maxPos = max(maxPos, i+nums[i])
            if i == end {
                end = maxPos
                step += 1
            }
        }
    }
    return step
}
jump([2,3,1,2,4,2,3])
