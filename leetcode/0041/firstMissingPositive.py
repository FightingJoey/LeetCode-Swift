def firstMissingPositive(nums: [int]) -> int:
	if not nums:
		return 1
	n = len(nums)
	table = set()
	for num in nums:
		table.add(num)
	for i in range(n):
		if i == 0:
			continue
		if not i in table:
			return i
	return n+1

def firstMissingPositive1(nums: [int]) -> int:
	if not nums:
		return 1
	nums.sort()
	last = 0
	num = 1
	for i in range(len(nums)):
		if num == nums[i]:
			last = nums[i]
			num += 1
		else:
			if nums[i] > 0 and nums[i] != last:
				return num
	return num

def firstMissingPositive2(nums: [int]) -> int:
	if not nums:
		return 1
	nums.sort()
	pre = 0
	for i in range(len(nums)):
		if nums[i] <= 0 or nums[i] == pre:
			continue
		elif nums[i] > pre + 1:
			break
		pre += 1
	return pre + 1

def firstMissingPositive3(nums: [int]) -> int:
	if not nums:
		return 1
	for i in range(len(nums)):
		while nums[i] > 0 and nums[i] <= len(nums) and nums[nums[i]-1] != nums[i]:
			nums[nums[i]-1], nums[i] = nums[i], nums[nums[i]-1]
	for i in range(len(nums)):
		if nums[i] != i+1:
			return i+1
	return len(nums)+1

def firstMissingPositive4(nums: [int]) -> int:
	if not nums:
		return 1
	n = len(nums)
	for i in range(n):
		nums[i] = n+1 if nums[i] <= 0 else nums[i]
	for i in range(n):
		num = abs(nums[i])
		if num <= n:
			nums[num-1] = -abs(nums[num-1])
	for i in range(n):
		if nums[i] > 0:
			return i+1
	return n+1

print(firstMissingPositive4([1,2,2,3,6,8]))