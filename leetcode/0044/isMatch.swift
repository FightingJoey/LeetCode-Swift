func isMatch(_ s: String, _ p: String) -> Bool {
    let s = Array(s), p = Array(p)
    let m = s.count, n = p.count
    var dp = [[Bool]]()
    for _ in 0..<m+1 {
        dp.append([Bool](repeating: false, count: n+1))
    }
    dp[0][0] = true
    
    for i in 1..<n+1 {
        if p[i-1] == "*" {
            dp[0][i] = true
        } else {
            break
        }
    }
    
    for i in 1..<m+1 {
        for j in 1..<n+1 {
            if p[j-1] == "*" {
                dp[i][j] = dp[i][j-1] || dp[i-1][j]
            } else if p[j-1] == "?" || s[i-1] == p[j-1] {
                dp[i][j] = dp[i-1][j-1]
            }
        }
    }
    
    return dp[m][n]
}
print(isMatch("aab", "c*a*b"))
