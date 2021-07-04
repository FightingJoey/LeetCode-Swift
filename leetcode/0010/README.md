# 10. [Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/)

## Question

Given an input string (`s`) and a pattern (`p`), implement regular expression matching with support for `'.'` and `'*'` where:` `

- `'.'` Matches any single character.
- `'*'` Matches zero or more of the preceding element.

The matching should cover the **entire** input string (not partial).

**Example 1:**

```
Input: s = "aa", p = "a"
Output: false
Explanation: "a" does not match the entire string "aa".
```

**Example 2:**

```
Input: s = "aa", p = "a*"
Output: true
Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
```

**Example 3:**

```
Input: s = "ab", p = ".*"
Output: true
Explanation: ".*" means "zero or more (*) of any character (.)".
```

**Example 4:**

```
Input: s = "aab", p = "c*a*b"
Output: true
Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
```

**Example 5:**

```
Input: s = "mississippi", p = "mis*is*p*."
Output: false
```

**Constraints:**

- `0 <= s.length <= 20`
- `0 <= p.length <= 30`
- `s` contains only lowercase English letters.
- `p` contains only lowercase English letters, `'.'`, and `'*'`.
- It is guaranteed for each appearance of the character `'*'`, there will be a previous valid character to match.

## [正则表达式匹配](https://leetcode-cn.com/problems/regular-expression-matching/)

给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

- '.' 匹配任意单个字符
- '*' 匹配零个或多个前面的那一个元素

所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。

## 解题思路

动态规划，[leetcode官方题解](https://leetcode-cn.com/problems/regular-expression-matching/solution/zheng-ze-biao-da-shi-pi-pei-by-leetcode-solution/)

## 代码实现

### Swift

```swift
func isMatch(_ s: String, _ p: String) -> Bool {
    let sArr = Array(s)
    let pArr = Array(p)
    var dp = Array(repeating: Array(repeating: false, count: pArr.count + 1), count: sArr.count + 1)
    dp[0][0] = true

    // deal with these strings
    // a* a*b* a*b*c*
    for j in 1 ..< dp[0].count {
        if pArr[j - 1] == "*" {
            dp[0][j] = dp[0][j - 2]
        }
    }

    for i in 1 ..< dp.count {
        for j in 1 ..< dp[0].count {
            if sArr[i - 1] == pArr[j - 1] || pArr[j - 1] == "." {
                // condition 1:
                dp[i][j] = dp[i - 1][j - 1]
            } else if pArr[j - 1] == "*" {
                // condition 2:
                dp[i][j] = dp[i][j - 2]
                if sArr[i - 1] == pArr[j - 2] || pArr[j - 2] == "." {
                    dp[i][j] = dp[i][j] || dp[i - 1][j]
                }
            }
        }
    }

    return dp[sArr.count][pArr.count]
}
```

### Python

```python
def isMatch(self, s: str, p: str) -> bool:
    m, n = len(s), len(p)

    def matches(i: int, j: int) -> bool:
        if i == 0:
            return False
        if p[j - 1] == '.':
            return True
        return s[i - 1] == p[j - 1]

    f = [[False] * (n + 1) for _ in range(m + 1)]
    f[0][0] = True
    for i in range(m + 1):
        for j in range(1, n + 1):
            if p[j - 1] == '*':
                f[i][j] |= f[i][j - 2]
                if matches(i, j - 1):
                    f[i][j] |= f[i - 1][j]
            else:
                if matches(i, j):
                    f[i][j] |= f[i - 1][j - 1]
    return f[m][n]

def isMatch(self, s: str, p: str) -> bool:
    def dp(i,j):
        # 已记录，直接返回
        if (i, j) in hash_table:
            return hash_table[(i, j)]

        # 若模式串已扫描完，检查字符串是否剩余
        if j == len(p):
            return i == len(s)

        # 检查s[i]是否能被匹配
        matchable = i < len(s)  and p[j] in {s[i], '.'}

        if j + 1 < len(p) and p[j + 1] == "*":
            # '*'匹配0次或多次的情况
            hash_table[(i, j)] = dp(i, j + 2) or (matchable and dp(i + 1, j))
        else:
            # 直接匹配的情况
            hash_table[(i, j)] = matchable and dp(i + 1, j + 1)
        return hash_table[(i, j)]
    hash_table = {}
    return dp(0, 0)
```

## 复杂度分析

- 时间复杂度：O(mn)，其中 m 和 n 分别是字符串 s 和 p 的长度。我们需要计算出所有的状态，并且每个状态在进行转移时的时间复杂度为 O(1)。
- 空间复杂度：*O*(mn)，即为存储所有状态使用的空间。
