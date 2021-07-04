// 动态规划
func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 {
        return s
    }

    let s = Array(s)
    // 最长回文串的起始位置 和长度
    var maxLen = 1
    var begin = 0

    var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)

    // 从下到上
    for i in (0..<s.count).reversed() {
        // 从左到右(j>=i)
        for j in i..<s.count {
            let len = (j-i+1)
            dp[i][j] = (s[i] == s[j]) && ( len <= 2 || dp[i+1][j-1])
            if dp[i][j] && len > maxLen {
                maxLen = len
                begin = i
            }
        }
    }
    return String(s[begin..<begin+maxLen])
}

// 中心扩展
func longestPalindrome(_ s: String) -> String {
    if s.isEmpty {
        return ""
    }
    var start = 0
    var end = 0
    let chars = [Character](s)
    for (i,_) in chars.enumerated() {
        let length1 = helper(chars: chars, left: i, right: i)
        let length2 = helper(chars: chars, left: i, right: i + 1)
        let length = max(length1, length2)
        if length > end - start + 1 {
            start = i - (length - 1) / 2
            end = i + length / 2
        }
    }
    return String(chars[start...end])
}

func helper(chars: [Character], left: Int, right: Int) -> Int {
    var l = left, r = right
    while l >= 0 && r < chars.count && chars[l] == chars[r] {
        l -= 1
        r += 1
    }
    return r - l - 1
}

// Manacher 算法
func longestPalindrome(_ s: String) -> String {
    var source = [Character]()
    for str in s {
        source.append("#")
        source.append(str)
    }
    source.append("#")
    var maxBegin = 0
    var maxLength = 0
    
    var center = 0
    var maxRight = 0
    var p = Array(repeating: 0, count: source.count)
    
    for i in 0..<source.count {
        if i < maxRight {
            p[i] = min(maxRight - i, p[2 * center - i])
        }
        
        var left = i - (p[i] + 1)
        var right = i + (p[i] + 1)
        while left >= 0,
        right < source.count,
        source[left] == source[right] {
            left -= 1
            right += 1
            p[i] += 1
        }
        
        if p[i] + i > maxRight {
            maxRight = p[i] + i
            center = i
        }
        
        if p[i] > maxLength {
            maxLength = p[i]
            maxBegin = (i - p[i]) / 2
        }
    }
    
    let start = s.index(s.startIndex, offsetBy: maxBegin)
    let end = s.index(start, offsetBy: maxLength)
    return String(s[start..<end])
}
