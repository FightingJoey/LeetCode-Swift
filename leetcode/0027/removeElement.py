def removeElement(nums: [int], val: int) -> int:
    left = 0
    right = len(nums)
    
    while left < right:
        if nums[left] == val:
            nums[left] = nums[right-1]
            right -= 1
        else:
            left += 1

    return left

print(removeElement([0,0,1,1,1,2,2,3,3,4], 3))
