def canJump(nums: [int]) -> bool:
	n = len(nums)
	if n == 1: return True
	maxPos = 0
	for i in range(n - 1):
		if maxPos >= i:
			maxPos = max(maxPos, i + nums[i])
			if maxPos >= n-1:
				return True
	return False

print(canJump([0]))