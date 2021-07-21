from typing import List
def combinationSum2(candidates: List[int], target: int) -> List[List[int]]:
    def dfs(begin, cur, target):
        if target == 0:
            res.append(cur[:])
            return

        for index in range(begin, size):
            if candidates[index] > target:
                break

            if index > begin and candidates[index - 1] == candidates[index]:
                continue

            cur.append(candidates[index])
            dfs(index + 1, cur, target - candidates[index])
            cur.pop()

    size = len(candidates)
    if size == 0:
        return []

    candidates.sort()
    res = []
    dfs(0, [], target)
    return res

print(combinationSum2([10,1,2,7,6,1,5], 8))