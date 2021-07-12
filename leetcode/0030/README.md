# 30. [Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words/)

## Question

You are given a string `s` and an array of strings `words` of **the same length**. Return all starting indices of substring(s) in `s` that is a concatenation of each word in `words` **exactly once**, **in any order**, and **without any intervening characters**.

You can return the answer in **any order**.

**Example 1:**

```
Input: s = "barfoothefoobarman", words = ["foo","bar"]
Output: [0,9]
Explanation: Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
The output order does not matter, returning [9,0] is fine too.
```

**Example 2:**

```
Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
Output: []
```

**Example 3:**

```
Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
Output: [6,9,12]
```

**Constraints:**

- `1 <= s.length <= 104`
- `s` consists of lower-case English letters.
- `1 <= words.length <= 5000`
- `1 <= words[i].length <= 30`
- `words[i]` consists of lower-case English letters.

## [串联所有单词的子串](https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words/)

给定一个字符串 s 和一些 **长度相同** 的单词 words 。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。

注意子串要与 words 中的单词完全匹配，**中间不能有其他字符**，但不需要考虑 words 中单词串联的顺序。

## 解题思路

滑动窗口

## 代码实现

### Swift

```swift
func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    if words.count == 0 {
        return []
    }
    let w_len = words[0].count, s_len = s.count
    let total_len = w_len * words.count // 子串的长度
    var wordDict = [String: Int]()
    for word in words {
        if let num = wordDict[word] {
            wordDict[word] = num + 1
        } else {
            wordDict[word] = 1
        }
    }
        
    var ans = [Int]()
    for offset in 0..<w_len {
        var leftOffset = offset
        let offsetMax = s_len - total_len
        while leftOffset <= offsetMax {
            var tempDict = wordDict
            var match = true
            
            var range = [Int]()
            var top = leftOffset + total_len
            while top > leftOffset {
                range.append(top)
                top -= w_len
            }
            
            var tempOffset = 0
            for hi in range {
                tempOffset = hi
                let word = s[hi-w_len, hi]
                if let num = tempDict[word] {
                    if num == 0 {
                        match = false
                        break
                    } else {
                        tempDict[word]! -= 1
                    }
                } else {
                    match = false
                    break
                }
            }
            if match {
                ans.append(leftOffset)
            }
            leftOffset = tempOffset
        }
    }
    
    return ans
}

extension String {
    subscript (left: Int, right: Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: left)
            let endIndex = self.index(self.startIndex, offsetBy: right)
            return String(self[startIndex..<endIndex])
        }
    }
}


print(findSubstring("barfoothefoobarman", ["foo", "bar"]))
```

### Python

```python
def findSubstring(s: str, words: [str]) -> [int]:
    if not words:return []
    w_len, s_len = len(words[0]), len(s)
    t_len = w_len * len(words)  # 子串的长度

    word_dict = {}  # words的哈希表
    for word in words:
        word_dict[word] = word_dict.get(word, 0) + 1

    ans = []
    for offset in range(w_len):
        lo, lo_max = offset, s_len - t_len
        while lo <= lo_max:
            tmp_dict = word_dict.copy()
            match = True
            # 从尾到头搜索单词
            for hi in range(lo + t_len, lo, -w_len): 
                # 切割出一个单词
                word = s[hi - w_len: hi] 
                # 如果这个单词不在tmp_dict中
                if word not in tmp_dict or tmp_dict.get(word, 0) == 0:
                    match = False
                    break   # 当前单词不符合要求 直接停止这个子串的搜索
                tmp_dict[word] -= 1 # 如果在
            if match:
                ans.append(lo)
            lo = hi # 对lo直接赋值
    return ans

print(findSubstring("barfoothefoobarman", ["foo", "bar"]))
```

## 复杂度分析

- 时间复杂度：O(nw)，n 是字符串 s 的长度，w 是 word 的长度
- 空间复杂度：O(1)