def trap(height: [int]) -> int:
    ans = 0
    left, right = 0, len(height) - 1
    leftMax = rightMax = 0

    while left < right:
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if leftMax < rightMax:
            ans += leftMax - height[left]
            left += 1
        else:
            ans += rightMax - height[right]
            right -= 1
    
    return ans
