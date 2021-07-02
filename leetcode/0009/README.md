# 9. [Palindrome Number](https://leetcode.com/problems/median-of-two-sorted-arrays/)

## Question

Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

**Example1:**

```
Input: 121
Output: true
```

**Example2:**

```
Input: -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes
121-. Therefore it is not a palindrome.
```

**Example 3:**

```
Input: 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

**Follow up:**

Coud you solve it without converting the integer to a string?

## [中文题目](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/)

给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。

**进阶：**你能不将整数转为字符串来解决这个问题吗？

## 解题思路

1. 将数字转换为字符串，并检查字符串是否为回文。题目不允许
2. 将数字本身反转，然后与原来的数字比较是否相等。有可能遇到整数溢出的问题
3. 将数字的一半反转，判断后一半反转后与前一半是否相等，问题是如何判断反转数字的位数已经达到原始数字的一半？判断反转数字是否大于等于剩余数字

## 代码实现

### Swift

```swift
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false
    }
    var x = x
    var halfNum = 0
    while x > halfNum {
        halfNum = halfNum * 10 + x % 10
        x = x / 10
    }
    return x == halfNum || x == halfNum / 10
}

let res = isPalindrome(121)
print(res)
```

### Python

```python
def isPalindrome(x: int) -> bool:
    if x < 0 or (x % 10 == 0 and x != 0):
        return False

    halfNum = 0
    while x > halfNum:
        halfNum = halfNum * 10 + x % 10;
        x = int(x/10)

    return x == halfNum or x == int(halfNum / 10)

res = isPalindrome(121)
print(res)
```

## 复杂度分析

- 时间复杂度：O(logn)，对于每次迭代，我们会将输入除以 10，因此时间复杂度为 O(logn)。
- 空间复杂度：O(1)。我们只需要常数空间存放若干变量。

