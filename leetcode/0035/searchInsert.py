def searchInsert(nums: [int], target: int) -> int:
	if not nums:
		return 0
	if target < nums[0]:
		return 0
	if target > nums[len(nums) - 1]:
		return len(nums)
	left, right = 0, len(nums) - 1
	while left <= right:
		mid = (left + right) // 2
		if nums[mid] == target:
			return mid
		if nums[left] <= target < nums[mid]:
			right = mid - 1
		elif nums[mid] < target <= nums[right]:
			left = mid + 1
		else:
			if target <= nums[left]:
				return left
			if target >= nums[right]:
				return right + 1
	return 0

print(searchInsert([1,2,4,6,7], 5))