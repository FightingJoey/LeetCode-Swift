# 20. [Valid Parentheses](https://leetcode.com/problems/valid-parentheses)

## Question

Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.

An input string is valid if:

1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.

**Example 1:**

```
Input: s = "()"
Output: true
```

**Example 2:**

```
Input: s = "()[]{}"
Output: true
```

**Example 3:**

```
Input: s = "(]"
Output: false
```

**Example 4:**

```
Input: s = "([)]"
Output: false
```

**Example 5:**

```
Input: s = "{[]}"
Output: true
```

**Constraints:**

- `1 <= s.length <= 104`
- `s` consists of parentheses only `'()[]{}'`.

## [有效的括号](https://leetcode-cn.com/problems/valid-parentheses)

给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

1. 左括号必须用相同类型的右括号闭合。
2. 左括号必须以正确的顺序闭合。

## 解题思路

首先，判断字符串的长度一定为偶数，否则可以直接返回 False

其次，我们运用辅助栈，因为后遇到的左括号要先闭合，所以比较适合于栈的结构，后进先出。遍历字符串，判断是否是左括号，是的话入栈，如果不是，判断当前字符与栈顶元素是否成对，是的话，栈顶元素出栈，否则直接返回 False。

## 代码实现

### Swift

```swift
func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else {
        return false
    }
    let pairs = [")": "(",
                 "]": "[",
                 "}": "{"]
    var stack = [String]()
    for ch in s {
        if let _ = pairs[String(ch)] {
            if stack.count == 0 || stack.last != pairs[String(ch)]  {
                return false
            }
            stack.popLast()
        } else {
            stack.append(String(ch))
        }
    }
    return stack.count == 0
}
print(isValid("([}}])"))
```

### Python

```python
def isValid(s: str) -> bool:
    if len(s) % 2 == 1:
        return False
    pairs = {
        ")": "(",
        "]": "[",
        "}": "{",
    }
    stack = list()
    for ch in s:
        if ch in pairs:
            if not stack or stack[-1] != pairs[ch]:
                return False
            stack.pop()
        else:
            stack.append(ch)
    return not stack

print(isValid("([}}])"))
```

## 复杂度分析

- 时间复杂度：O(n)，其中 n 是字符串 s 的长度。
- 空间复杂度：O(n)