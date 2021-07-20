var n = 0
var ans = [[Int]]()
var sortedCandidates = [Int]()
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    n = candidates.count
    ans = [[Int]]()
    sortedCandidates = candidates.sorted()
    
    dfs(target, [], 0)
    
    return ans
}

func dfs(_ target: Int, _ cur: [Int], _ begin: Int) {
    var cur = cur
    if target == 0 {
        ans.append(cur)
    } else {
        for i in begin..<n {
            if target - sortedCandidates[i] < 0 {
                break
            }
            cur.append(sortedCandidates[i])
            dfs(target-sortedCandidates[i], cur, i)
            cur.popLast()
        }
    }
}

print(combinationSum([2,3,6,7], 7))
