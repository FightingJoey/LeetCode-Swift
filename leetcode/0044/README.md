# 44. [Wildcard Matching](https://leetcode.com/problems/wildcard-matching)

## Question

Given an input string (`s`) and a pattern (`p`), implement wildcard pattern matching with support for `'?'` and `'*'` where:

- `'?'` Matches any single character.
- `'*'` Matches any sequence of characters (including the empty sequence).

The matching should cover the **entire** input string (not partial).

**Example 1:**

```
Input: s = "aa", p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
```

**Example 2:**

```
Input: s = "aa", p = "*"
Output: true
Explanation: '*' matches any sequence.
```

**Example 3:**

```
Input: s = "cb", p = "?a"
Output: false
Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
```

**Example 4:**

```
Input: s = "adceb", p = "*a*b"
Output: true
Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
```

**Example 5:**

```
Input: s = "acdcb", p = "a*c?b"
Output: false
```

**Constraints:**

- `0 <= s.length, p.length <= 2000`
- `s` contains only lowercase English letters.
- `p` contains only lowercase English letters, `'?'` or `'*'`.

## [通配符匹配](https://leetcode-cn.com/problems/wildcard-matching)

给定一个字符串 (s) 和一个字符模式 (p) ，实现一个支持 `?` 和 `*` 的通配符匹配。

- `?` 可以匹配任何单个字符。
- `*` 可以匹配任意字符串（包括空字符串）。

两个字符串完全匹配才算匹配成功。

说明：

- s 可能为空，且只包含从 a-z 的小写字母。
- p 可能为空，且只包含从 a-z 的小写字母，以及字符 ? 和 *。

## 解题思路

动态规划

## 代码实现

### Swift

```swift
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
```

### Python

```python
def isMatch(s: str, p: str) -> bool:
    m, n = len(s), len(p)

    dp = [[False] * (n + 1) for _ in range(m + 1)]
    dp[0][0] = True

    for i in range(1, n + 1):
        if p[i - 1] == '*':
            dp[0][i] = True
        else:
            break
    
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if p[j - 1] == '*':
                dp[i][j] = dp[i][j - 1] | dp[i - 1][j]
            elif p[j - 1] == '?' or s[i - 1] == p[j - 1]:
                dp[i][j] = dp[i - 1][j - 1]
            
    return dp[m][n]
print(isMatch("aab", "c*a*b"))
```

## 复杂度分析

- 时间复杂度：O(mn)
- 空间复杂度：O(mn)