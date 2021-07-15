def searchRange(nums: [int], target: int) -> [int]:
	if not nums:
		return [-1, -1]
	left, right = 0, len(nums)-1
	while left <= right:
		mid = (left + right) // 2
		if nums[mid] == target:
			result = []
			temp = mid
			while temp-1 >= 0 and nums[temp] == nums[temp - 1]:
				temp -= 1
			result.append(temp)
			temp = mid
			while temp+1 <= len(nums)-1 and nums[temp] == nums[temp+1]:
				temp += 1
			result.append(temp)
			return result
		if nums[left] <= target < nums[mid]:
			right = mid - 1
		elif nums[mid] < target <= nums[right]:
			left = mid + 1
		else:
			return [-1, -1]
	return [-1, -1]

def searchRange2(nums: [int], target: int) -> [int]:
	if not nums:
		return [-1, -1]
	def binarySearch(nums: [int], target: int, lower: bool):
		left, right, ans = 0, len(nums) - 1, len(nums)
		while left <= right:
			mid = (left + right) // 2
			if nums[mid] > target or (lower and nums[mid] == target):
				right = mid - 1
				ans = mid
			else:
				left = mid + 1
		return ans
	left_index = binarySearch(nums, target, True)
	right_index = binarySearch(nums, target, False) - 1
	if left_index <= right_index and right_index < len(nums) and nums[left_index] == target and nums[right_index] == target:
		return [left_index, right_index]
	return [-1, -1]

print(searchRange2([5,7,7,8,8,10], 7))
