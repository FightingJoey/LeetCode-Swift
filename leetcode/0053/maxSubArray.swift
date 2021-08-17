func maxSubArray(_ nums: [Int]) -> Int {
    var pre = 0, maxAns = nums[0]
    for x in nums {
        pre = max(pre + x, x)
        maxAns = max(maxAns, pre)
    }
    return maxAns
}
