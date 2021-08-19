func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var left = newInterval[0], right = newInterval[1]
    var placed = false
    var ans: [[Int]] = []
    for interval in intervals {
        let li = interval[0]
        let ri = interval[1]
        if li > right {
            if !placed {
                ans.append([left, right])
                placed = true
            }
            ans.append(interval)
        }
        else if ri < left {
            ans.append(interval)
        }
        else {
            left = min(left, li)
            right = max(right, ri)
        }
    }
    if !placed {
        ans.append([left, right])
    }
    return ans
}
