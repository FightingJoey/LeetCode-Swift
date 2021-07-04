# 3. Longest Substring Without Repeating Characters

## Question

Given a string, find the length of the longest substring without repeating characters.

**Example1:**

```
Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
```

**Example2:**

```
Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

**Example3:**

```
Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

## [无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/)

给定一个字符串，请你找出其中不含有重复字符的 **最长子串** 的长度。

## 解题思路

核心思想：滑动窗口。

用一个数组来保存子串，遍历给定的字符串中的字符，判断字符是否在数组中，如果在，判断重复字符的位置，将数组该位置之前的数据删除，再把字符添加进数组；如果不在，数组添加字符，对比当前数组长度与之前记录的最长子串的长度，取最大的。

## 代码实现

### Swift

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    var list: Array<Character> = []
    var ans = 0
    for char in s {
        if let firstIndex = list.firstIndex(of: char) {
            list = Array(list[firstIndex+1..<list.endIndex])
            list.append(char)
        } else {
            list.append(char)
            ans = ans < list.count ? list.count : ans
        }
    }
    return ans
}

let res = lengthOfLongestSubstring("pwwkew")
print(res)
```

### Python

```python
def lengthOfLongestSubstring(s: str) -> int:
    if not s: return 0
    if len(s) == 0: return 0
    resList = []
    ans = 0
    for i in range(len(s)):
        if s[i] in resList:
            index = resList.index(s[i])
            resList = resList[index+1:]
            resList.append(s[i])
        else:
            resList.append(s[i])
            if ans < len(resList):
                ans = len(resList)
    return ans

res = lengthOfLongestSubstring('abcabcbb')
print(res)
```

### 在网上看到的执行效率最高的代码：

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    let charArr = Array(s.utf8)
    var start = 0, end = 0, i = 0, maxLength = 0  //滑动窗口 三指针
    while end < charArr.count {
        i = start
        while i < end { //遍历start 到end 是否有重复 三指针滑动窗口
            if charArr[i] == charArr[end] {  // 新加入的（【end】）和之前的有没有重复， 有重复了 这时候 idx 指向重复的， 直接把做窗口移动过来 指向下一个    精髓所在！！！！！！
                start = i + 1
                break
            }
            i += 1
        }
        maxLength = max(maxLength, end - start + 1)  // 走到这，说明没重复， 更新maxLength 窗口大小
        end += 1   // 窗口右移动 （没有重复）
    }
    return maxLength
}

let res = lengthOfLongestSubstring("pwwkew")
print(res)
```

他这里最棒的地方在于，并没有来回修改数组，只是修改了指针位置，所以效率更高。

## 复杂度分析

- 时间复杂度：O(N)，其中 N 是字符串的长度。
- 空间复杂度：O(N)，数组存储的子串的长度。
