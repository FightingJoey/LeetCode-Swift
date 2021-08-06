var n: Int = 0
var list: [Int] = []
func permute(_ nums: [Int]) -> [[Int]] {
    list = nums
    n = nums.count
    var result = [[Int]]()
    backtrace(result: &result)
    return result
}

func backtrace(first: Int = 0, result: inout [[Int]]) {
    if first == n {
        result.append(list)
    } else {
        for i in first..<n {
            list.swapAt(first, i)
            backtrace(first: first + 1, result: &result)
            list.swapAt(first, i)
        }
    }
}

print(permute([1,2,3]))
