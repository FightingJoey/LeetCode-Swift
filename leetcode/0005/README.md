# 5. [Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

## Question

Given a string `s`, return *the longest palindromic substring* in `s`.

**Example 1:**

```
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
```

**Example 2:**

```
Input: s = "cbbd"
Output: "bb"
```

**Example 3:**

```
Input: s = "a"
Output: "a"
```

**Example 4:**

```
Input: s = "ac"
Output: "a"
```

**Constraints:**

- `1 <= s.length <= 1000`
- `s` consist of only digits and English letters (lower-case and/or upper-case)

## [最长回文子串](https://leetcode-cn.com/problems/longest-palindromic-substring/)

给你一个字符串 `s`，找到 `s` 中最长的回文子串。

## 解题思路

动态规划，中心扩展、Manacher 算法，[leetcode官方题解](https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zui-chang-hui-wen-zi-chuan-by-leetcode-solution/)

## 代码实现

### Swift

```swift
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
```

### Python

```python
# 动态规划
def longestPalindrome(s: str) -> str:
    n = len(s)
    if n < 2:
        return s
    
    max_len = 1
    begin = 0
    # dp[i][j] 表示 s[i..j] 是否是回文串
    dp = [[False] * n for _ in range(n)]
    for i in range(n):
        dp[i][i] = True
    
    # 递推开始
    # 先枚举子串长度
    for L in range(2, n + 1):
        # 枚举左边界，左边界的上限设置可以宽松一些
        for i in range(n):
            # 由 L 和 i 可以确定右边界，即 j - i + 1 = L 得
            j = L + i - 1
            # 如果右边界越界，就可以退出当前循环
            if j >= n:
                break
                
            if s[i] != s[j]:
                dp[i][j] = False 
            else:
                if j - i < 3:
                    dp[i][j] = True
                else:
                    dp[i][j] = dp[i + 1][j - 1]
            
            # 只要 dp[i][L] == true 成立，就表示子串 s[i..L] 是回文，此时记录回文长度和起始位置
            if dp[i][j] and j - i + 1 > max_len:
                max_len = j - i + 1
                begin = i
    return s[begin:begin + max_len]

# 中心扩展
def longestPalindrome(s: str) -> str:
    start, end = 0, 0
    for i in range(len(s)):
        left1, right1 = self.expandAroundCenter(s, i, i)
        left2, right2 = self.expandAroundCenter(s, i, i + 1)
        if right1 - left1 > end - start:
            start, end = left1, right1
        if right2 - left2 > end - start:
            start, end = left2, right2
    return s[start: end + 1]

def expandAroundCenter(s, left, right):
    while left >= 0 and right < len(s) and s[left] == s[right]:
        left -= 1
        right += 1
    return left + 1, right - 1

# Manacher 算法
def expand(self, s, left, right):
    while left >= 0 and right < len(s) and s[left] == s[right]:
        left -= 1
        right += 1
    return (right - left - 2) // 2

def longestPalindrome(self, s: str) -> str:
    end, start = -1, 0
    s = '#' + '#'.join(list(s)) + '#'
    arm_len = []
    right = -1
    j = -1
    for i in range(len(s)):
        if right >= i:
            i_sym = 2 * j - i
            min_arm_len = min(arm_len[i_sym], right - i)
            cur_arm_len = self.expand(s, i - min_arm_len, i + min_arm_len)
        else:
            cur_arm_len = self.expand(s, i, i)
        arm_len.append(cur_arm_len)
        if i + cur_arm_len > right:
            j = i
            right = i + cur_arm_len
        if 2 * cur_arm_len + 1 > end - start:
            start = i - cur_arm_len
            end = i + cur_arm_len
    return s[start+1:end+1:2]

print(longestPalindrome("babad"))
```

## 复杂度分析

### 动态规划

时间复杂度：O(n^2)，其中 n 是字符串的长度。

空间复杂度：O(n^2)

### 中心扩展

时间复杂度：O(n^2)

空间复杂度：O(1)

### Manacher 算法

时间复杂度：O(n)

空间复杂度：O(n)
