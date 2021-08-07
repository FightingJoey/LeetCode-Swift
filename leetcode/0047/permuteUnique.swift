var n: Int = 0
var list: [Int] = []
var result = [[Int]]()
var used = [Bool]()

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    list = nums.sorted()
    n = nums.count
    
    used = Array.init(repeating: false, count: n)
    backtrace(depath: 0, path: [])
    return result
}

func backtrace(depath: Int = 0, path: [Int]) {
    if depath == n {
        result.append(path)
    } else {
        var path = path
        for i in 0..<n {
            if used[i] || (i > 0 && list[i] == list[i-1] && !used[i-1]) {
                continue
            }
            used[i] = true
            path.append(list[i])
            backtrace(depath: depath + 1, path: path)
            used[i] = false
            path.popLast()
        }
    }
}

print(permuteUnique([1,1,2]))
