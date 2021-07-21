var n = 0
var ans = [[Int]]()
var sortedCandidates = [Int]()
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
            if sortedCandidates[i] > target {
                break
            }
            if i > begin && sortedCandidates[i - 1] == sortedCandidates[i] {
                continue
            }
            cur.append(sortedCandidates[i])
            dfs(target-sortedCandidates[i], cur, i+1)
            cur.popLast()
        }
    }
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
