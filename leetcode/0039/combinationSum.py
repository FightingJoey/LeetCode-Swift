from typing import List
def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
    n = len(candidates)
    ans = []
    candidates.sort()
    def search(target,cur,begin):
        if target == 0:
            ans.append(cur[:])
        else:
            for i in range(begin,n):
                if target-candidates[i] < 0:
                    break
                cur.append(candidates[i])
                search(target-candidates[i],cur,i)
                cur.pop()
    search(target,[],0)
    return ans