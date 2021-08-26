# 58. [Length of Last Word](https://leetcode.com/problems/length-of-last-word)

## Question

Given a string `s` consisting of some words separated by some number of spaces, return *the length of the **last** word in the string.*

A **word** is a maximal substring consisting of non-space characters only.

**Example 1:**

```
Input: s = "Hello World"
Output: 5
Explanation: The last word is "World" with length 5.
```

**Example 2:**

```
Input: s = "   fly me   to   the moon  "
Output: 4
Explanation: The last word is "moon" with length 4.
```

**Example 3:**

```
Input: s = "luffy is still joyboy"
Output: 6
Explanation: The last word is "joyboy" with length 6.
```

## [最后一个单词的长度](https://leetcode-cn.com/problems/length-of-last-word)

给你一个字符串 `s`，由若干单词组成，单词前后用一些空格字符隔开。返回字符串中最后一个单词的长度。

**单词** 是指仅由字母组成、不包含任何空格字符的最大子字符串。

## 解题思路

从右向左遍历，从第一个不是空格的字符开始计数，一旦开始计数，再遇到空格就结束了

## 代码实现

### Swift

```swift
func lengthOfLastWord(_ s: String) -> Int {
    var count = 0
    for i in s.reversed() {
        if i != " " {
            count += 1
        } else if count > 0 {
            return count
        }
    }
    return count
}

lengthOfLastWord("sadf sdfds")
```

### Python

```python
def lengthOfLastWord(s: str) -> int:
	count = 0
	for c in range(len(s)-1, -1, -1):
		if s[c] == " ":
			if count == 0:
				continue
			else:
				break
		else:
			count += 1
	return count

print(lengthOfLastWord("s"))
```

## 复杂度分析

- 时间复杂度：O(n)
- 空间复杂度：O(1)

