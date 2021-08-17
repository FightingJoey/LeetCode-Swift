func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count > 0 && matrix[0].count > 0  else {
        return []
    }
    let rows = matrix.count, columns = matrix[0].count
    var order = [Int]()
    var left = 0, right = columns - 1, top = 0, bottom = rows - 1
    while left <= right && top <= bottom {
        for column in left..<right+1 {
            order.append(matrix[top][column])
        }
        for row in top+1..<bottom+1 {
            order.append(matrix[row][right])
        }
        if left < right && top < bottom {
            for column in stride(from: right-1, to: left, by: -1) {
                order.append(matrix[bottom][column])
            }
            for row in stride(from: bottom, to: top, by: -1) {
                order.append(matrix[row][left])
            }
        }
        left = left + 1
        right = right - 1
        top = top + 1
        bottom = bottom - 1
    }
    return order
}
print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
