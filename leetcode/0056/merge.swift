func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals = intervals.sorted { $0[0] < $1[0] }
    var merged: [[Int]] = []
    for interval in intervals {
        if merged.count == 0 || merged[merged.count-1][1] < interval[0] {
            merged.append(interval)
        }
        else {
            merged[merged.count-1][1] = max(merged[merged.count-1][1], interval[1])
        }
    }
    return merged
}

print(merge([[1,3],[8,10],[15,18],[2,6],[0,1]]))
