# 14. [Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix)

## Question

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string `""`.

**Example 1:**

```
Input: strs = ["flower","flow","flight"]
Output: "fl"
```

**Example 2:**

```
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
```

**Constraints:**

- `1 <= strs.length <= 200`
- `0 <= strs[i].length <= 200`
- `strs[i]` consists of only lower-case English letters.

## [最长公共前缀](https://leetcode-cn.com/problems/longest-common-prefix)

编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 `""`。

## 解题思路

### 横向扫描

依次遍历字符串数组中的每个字符串，对于每个遍历到的字符串，更新最长公共前缀，当遍历完所有的字符串以后，即可得到字符串数组中的最长公共前缀。

如果在尚未遍历完所有的字符串时，最长公共前缀已经是空串，则最长公共前缀一定是空串，因此不需要继续遍历剩下的字符串，直接返回空串即可。

### 纵向扫描

从前往后遍历所有字符串的每一列，比较相同列上的字符是否相同，如果相同则继续对下一列进行比较，如果不相同则当前列不再属于公共前缀，当前列之前的部分为最长公共前缀。

## 代码实现

### Swift

```swift
// 横向扫描
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var prefix: String? = strs[0]
    for i in 1..<strs.count {
        prefix = lcp(str1: prefix ?? "", str2: strs[i])
        guard let _ = prefix else {
            break
        }
    }
    return prefix ?? ""
}

func lcp(str1: String, str2: String) -> String? {
    var index = 0
    let length = min(str1.count, str2.count)
    while index < length && str1[index] == str2[index] {
        index += 1
    }
    return String(str1.prefix(index))
}

extension String {
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
}

// 纵向扫描
func longestCommonPrefix2(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    let length = strs[0].count
    let count = strs.count
    for i in 0..<length {
        let char = strs[0][i]
        for j in 1..<count {
            if strs[j].count == i || strs[j][i] != char {
                return String(strs[0].prefix(i))
            }
        }
    }
    return strs[0]
}
```

#### 网上效率更高的

```swift
func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""
    if strs.count > 0 {
        if let firstObjc = strs.first {
            if strs.count > 1 {
                let numbers = strs.sorted()

                let first = numbers.first!
                let last = numbers.last!
                
                let lastArray = Array(last)
                for (index, firstChar) in first.enumerated() {
                    if lastArray[index] != firstChar {
                        return result
                    }
                    result += String(firstChar)
                }
            } else {
                result = firstObjc
            }
        }
    }
    return result
}
```

### Python

```python
# 横向扫描
def longestCommonPrefix(strs: [str]) -> str:
    if not strs:
        return ""
    
    prefix, count = strs[0], len(strs)
    for i in range(1, count):
        prefix = lcp(prefix, strs[i])
        if not prefix:
            break
    
    return prefix

def lcp(str1, str2):
    length, index = min(len(str1), len(str2)), 0
    while index < length and str1[index] == str2[index]:
        index += 1
    return str1[:index]

# 纵向扫描
def longestCommonPrefix2(strs: [str]) -> str:
    if not strs:
        return ""
    
    length, count = len(strs[0]), len(strs)
    for i in range(length):
        c = strs[0][i]
        if any(i == len(strs[j]) or strs[j][i] != c for j in range(1, count)):
            return strs[0][:i]
    
    return strs[0]

print(longestCommonPrefix(["flower","flow","flight"]))
```

## 复杂度分析

- 时间复杂度：O(mn)，其中 m 是字符串数组中的字符串的平均长度，n 是字符串的数量。最坏情况下，字符串数组中的每个字符串的每个字符都会被比较一次。
- 空间复杂度：O(1)。使用的额外空间复杂度为常数。

