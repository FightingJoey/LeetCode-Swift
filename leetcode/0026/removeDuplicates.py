def removeDuplicates(nums: [int]) -> int:
    if not nums:
        return 0
    
    n = len(nums)
    fast = slow = 1
    while fast < n:
        if nums[fast] != nums[fast - 1]:
            nums[slow] = nums[fast]
            slow += 1
        fast += 1

    return slow

print(removeDuplicates([0,0,1,1,1,2,2,3,3,4])) 