func maxArea(_ height: [Int]) -> Int {
    var l = 0, r = height.count - 1
    var ans = 0
    while l < r {
        ans = max(ans, min(height[l], height[r]) * (l - r))
        if height[l] <= height[r] {
            l += 1
        }
        else {
            r -= 1
        }
    }
    return ans
}

print(maxArea([1,8,6,2,5,4,8,3,7]))
