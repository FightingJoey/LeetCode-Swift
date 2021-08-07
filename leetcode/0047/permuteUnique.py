def permuteUnique(nums: [int]) -> [[int]]:
    def dfs(depth, path):
        if depth == size:
            res.append(path.copy())
            return
        for i in range(size):
            if used[i] or (i > 0 and nums[i] == nums[i - 1] and not used[i - 1]):
                continue

            used[i] = True
            path.append(nums[i])
            dfs(depth + 1, path)
            used[i] = False
            path.pop()

    size = len(nums)
    if size == 0: return []
    nums.sort()

    used = [False] * len(nums)
    res = []
    dfs(0, [])
    return res

print(permuteUnique([1,1,2]))