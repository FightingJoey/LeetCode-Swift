func trap(_ height: [Int]) -> Int {
    var ans = 0
    var left = 0, right = height.count - 1, leftMax = 0, rightMax = 0
    while left < right {
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if leftMax < rightMax {
            ans += leftMax - height[left]
            left += 1
        } else {
            ans += rightMax - height[right]
            right -= 1
        }
    }
    return ans
}
