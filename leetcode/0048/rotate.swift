func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0..<n/2 {
        for j in 0..<(n+1)/2 {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[n - j - 1][i]
            matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
            matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1]
            matrix[j][n - i - 1] = temp
        }
    }
}

func rotate2(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0..<n/2 {
        for j in 0..<n {
            (matrix[i][j], matrix[n-1-i][j]) = (matrix[n-1-i][j], matrix[i][j])
        }
    }
    for i in 0..<n {
        for j in 0..<i {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
}

var m = [[1,2,3],[4,5,6],[7,8,9]]
rotate2(&m)
print(m)
