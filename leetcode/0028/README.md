# 28. [Implement strStr()](https://leetcode.com/problems/implement-strstr)

## Question

Implement [strStr()](http://www.cplusplus.com/reference/cstring/strstr/).

Return the index of the first occurrence of needle in haystack, or `-1` if `needle` is not part of `haystack`.

**Clarification:**

What should we return when `needle` is an empty string? This is a great question to ask during an interview.

For the purpose of this problem, we will return 0 when `needle` is an empty string. This is consistent to C's [strstr()](http://www.cplusplus.com/reference/cstring/strstr/) and Java's [indexOf()](https://docs.oracle.com/javase/7/docs/api/java/lang/String.html#indexOf(java.lang.String)).

**Example 1:**

```
Input: haystack = "hello", needle = "ll"
Output: 2
```

**Example 2:**

```
Input: haystack = "aaaaa", needle = "bba"
Output: -1
```

**Example 3:**

```
Input: haystack = "", needle = ""
Output: 0
```

**Constraints:**

- `0 <= haystack.length, needle.length <= 5 * 104`
- `haystack` and `needle` consist of only lower-case English characters.

## [实现 strStr()](https://leetcode-cn.com/problems/implement-strstr/)

实现 strStr() 函数。

给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。

说明：

当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。

对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。

## 解题思路

直接匹配

## 代码实现

### Swift

```swift
func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle || needle.count == 0 {
        return 0
    }
    if haystack.count < needle.count{
        return -1
    }
    var a: String = haystack
    for i in 0...(a.count - needle.count) {
        if a.hasPrefix(needle) {
            return i
        }
        a.remove(at: a.startIndex)
    }
    return -1
}

print(strStr("mississippi", "issip"))

```

### Python

```python
def strStr(haystack: str, needle: str) -> int:
    l_h = len(haystack)
    l_n = len(needle)
    if l_n == 0:
        return 0
    for i in range(l_h - l_n + 1):
        if needle == haystack[i:i+l_n]:
            return i
    return -1

print(strStr("mississippi", "issip"))
```

## 复杂度分析

- 时间复杂度：O(n-m)
- 空间复杂度：O(1)