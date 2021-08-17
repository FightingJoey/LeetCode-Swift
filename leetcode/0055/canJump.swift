func canJump(_ nums: [Int]) -> Bool {
      guard nums.count > 1 else { return true }
    let n = nums.count
    var maxPos = 0
    for i in 0..<n-1 {
        if maxPos >= i {
            maxPos = max(maxPos, i+nums[i])
            if maxPos >= n-1 {
                  return true
            }
        }
    }
    return false
}
jump([2,3,1,2,4,2,3])
