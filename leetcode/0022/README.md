# 22. [Generate Parentheses](https://leetcode.com/problems/generate-parentheses)

## Question

Given `n` pairs of parentheses, write a function to *generate all combinations of well-formed parentheses*.

**Example 1:**

```
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]
```

**Example 2:**

```
Input: n = 1
Output: ["()"]
```

**Constraints:**

- `1 <= n <= 8`

## [括号生成](https://leetcode-cn.com/problems/generate-parentheses)

数字 `n` 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 **有效的** 括号组合。

## 解题思路

回溯法，我们只在序列仍然保持有效时才添加 `'('` or `')'`，我们可以通过跟踪到目前为止放置的左括号和右括号的数目来做到这一点，如果左括号数量不大于 n*n*，我们可以放一个左括号。如果右括号数量小于左括号的数量，我们可以放一个右括号。

## 代码实现

### Swift

```swift
var res = [String]()

func generateParenthesis(_ n: Int) -> [String] {
    dfs("", 0, 0, n)
    return res
}
 
func dfs(_ paths: String, _ left: Int, _ right: Int, _ n: Int) {
    if paths.count == n*2 {
        res.append(paths)
        return
    }
    if left < n {
        dfs(paths + "(", left + 1, right, n)
    }
    if right < left {
        dfs(paths + ")", left, right + 1, n)
    }
}

print(generateParenthesis(2))
```

### Python

```python
def generateParenthesis(n) -> [str]:
    res = []

    def dfs(paths, left, right):
        if len(paths) == n * 2:  # 因为括号都是成对出现的
            res.append(paths)
            return
        if left < n:
            dfs(paths + '(', left + 1, right)
        if right < left:
            dfs(paths + ')', left, right + 1)
            
    dfs('', 0, 0)
    return res

print(generateParenthesis(3))
```

## 复杂度分析

- 时间复杂度：
- 空间复杂度：O(n)，除了答案数组之外，我们所需要的空间取决于递归栈的深度，每一层递归函数需要 O(1) 的空间，最多递归 2n 层，因此空间复杂度为 O(n)。

