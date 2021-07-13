# 32. [Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses)

## Question

Given a string containing just the characters `'('` and `')'`, find the length of the longest valid (well-formed) parentheses substring.

**Example 1:**

```
Input: s = "(()"
Output: 2
Explanation: The longest valid parentheses substring is "()".
```

**Example 2:**

```
Input: s = ")()())"
Output: 4
Explanation: The longest valid parentheses substring is "()()".
```

**Example 3:**

```
Input: s = ""
Output: 0 
```

**Constraints:**

- `0 <= s.length <= 3 * 104`
- `s[i]` is `'('`, or `')'`.

## [最长有效括号](https://leetcode-cn.com/problems/longest-valid-parentheses)

给你一个只包含 `'('` 和 `')'` 的字符串，找出最长有效（格式正确且连续）括号子串的长度。

## 解题思路

1. 使用辅助栈，我们始终保持栈底元素为当前已经遍历过的元素中「最后一个没有被匹配的右括号的下标」，这样的做法主要是考虑了边界条件的处理，栈里其他元素维护左括号的下标：
   - 对于遇到的每个  `'('`，我们将它的下标放入栈中
   - 对于遇到的每个  `')'`，我们先弹出栈顶元素表示匹配了当前右括号：
     - 如果栈为空，说明当前的右括号为没有被匹配的右括号，我们将其下标放入栈中来更新我们之前提到的「最后一个没有被匹配的右括号的下标」
     - 如果栈不为空，当前右括号的下标减去栈顶元素即为「以该右括号为结尾的最长有效括号的长度」

2. 利用两个计数器 left 和 right 。首先，我们从左到右遍历字符串，对于遇到的每个  `'('`，我们增加 left 计数器，对于遇到的每个  `')'` ，我们增加 right 计数器。每当 left 计数器与right 计数器相等时，我们计算当前有效字符串的长度，并且记录目前为止找到的最长子字符串。当 right 计数器比 left 计数器大时，我们将 left 和 \right 计数器同时变回 0。

   这样的做法贪心地考虑了以当前字符下标结尾的有效括号长度，每次当右括号数量多于左括号数量的时候之前的字符我们都扔掉不再考虑，重新从下一个字符开始计算，但这样会漏掉一种情况，就是遍历的时候左括号的数量始终大于右括号的数量，即 `(() `，这种时候最长有效括号是求不出来的。

   解决的方法也很简单，我们只需要从右往左遍历用类似的方法计算即可。


## 代码实现

### Swift

```swift
func longestValidParentheses(_ s: String) -> Int {
    var result = 0
    let strList = Array(s)
    var stack = [Int]()
    stack.append(-1)
    for i in 0..<strList.count {
        if strList[i] == "(" {
            stack.append(i)
        } else {
            stack.popLast()
            if stack.isEmpty {
                stack.append(i)
            } else {
                let top = stack.count - 1
                result = max(result, i - stack[top])
            }
        }
    }
    return result
}

func longestValidParentheses2(_ s: String) -> Int {
    var left = 0, right = 0, maxLength = 0
    let strList = Array(s)
    for i in 0..<strList.count {
        if strList[i] == "(" {
            left += 1
        } else {
            right += 1
        }
        if left == right {
            maxLength = max(maxLength, 2*right)
        } else if right > left {
            left = 0
            right = 0
        }
    }
    left = 0
    right = 0
    for i in 0..<strList.count {
        let index = strList.count-1-i
        if strList[index] == "(" {
            left += 1
        } else {
            right += 1
        }
        if left == right {
            maxLength = max(maxLength, 2*right)
        } else if left > right {
            left = 0
            right = 0
        }
    }
    return maxLength
}

print(longestValidParentheses2("(()"))
```

### Python

```python
def longestValidParentheses(s: str) -> int:
	result = 0
	stack = list()
	stack.append(-1)
	for i in range(len(s)):
		if s[i] == "(":
			stack.append(i)
		else:
			stack.pop()
			if not stack:
				stack.append(i)
			else:
				top = len(stack)-1
				result = max(result, i - stack[top])
	return result

def longestValidParentheses2(s: str) -> int:
	left, right, maxLength = 0, 0, 0
	for i in range(len(s)):
		if s[i] == '(':
			left += 1
		else:
			right += 1
		if left == right:
			maxLength = max(maxLength, 2*right)
		elif right > left:
			left, right = 0, 0
	left, right = 0, 0
	for i in range(len(s)):
		index = len(s)-1-i
		if s[index] == "(":
			left += 1
		else:
			right += 1
		if left == right:
			maxLength = max(maxLength, 2*right)
		elif left > right:
			left, right = 0, 0
	return maxLength

print(longestValidParentheses2("()(()"))
```

## 复杂度分析

### 辅助栈

- 时间复杂度：O(n)，其中 n 为字符串长度。
- 空间复杂度：O(n)，栈的大小在最坏情况下会达到 n。

### 计数器

- 时间复杂度：O(n)，其中 n 为字符串长度。
- 空间复杂度：O(1)