func generateMatrix(_ n: Int) -> [[Int]] {
    var matrix = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
    var left = 0, right = n - 1, top = 0, bottom = n - 1
    var insertN = 1
    while left <= right && top <= bottom {
        for column in left..<right+1 {
            matrix[top][column] = insertN
            insertN += 1
        }
        for row in top+1..<bottom+1 {
            matrix[row][right] = insertN
            insertN += 1
        }
        if left < right && top < bottom {
            for column in stride(from: right-1, to: left, by: -1) {
                matrix[bottom][column] = insertN
                insertN += 1
            }
            for row in stride(from: bottom, to: top, by: -1) {
                matrix[row][left] = insertN
                insertN += 1
            }
        }
        left = left + 1
        right = right - 1
        top = top + 1
        bottom = bottom - 1
    }
    
    return matrix
}
print(generateMatrix(3))
