# 7. [Reverse Integer](https://leetcode.com/problems/reverse-integer/)

## Question

Given a signed 32-bit integer `x`, return `x` *with its digits reversed*. If reversing `x` causes the value to go outside the signed 32-bit integer range `[-231, 231 - 1]`, then return `0`.

**Assume the environment does not allow you to store 64-bit integers (signed or unsigned).**

**Example 1:**

```
Input: x = 123
Output: 321
```

**Example 2:**

```
Input: x = -123
Output: -321
```

**Example 3:**

```
Input: x = 120
Output: 21
```

**Example 4:**

```
Input: x = 0
Output: 0 
```

**Constraints:**

- `-231 <= x <= 231 - 1`

## [整数反转](https://leetcode-cn.com/problems/reverse-integer/)

给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

假设环境不允许存储 64 位整数（有符号或无符号）。

## 解题思路

先求出x的绝对值y，然后划定反转后数字的取值范围 boundry，对 y 求余得到 x 末尾的数字，然后将其乘以10放入结果ans中，如果 ans > boundry，那么说明超出范围直接返回0。然后更新 y，重复之前的操作直到 y = 0。

## 代码实现

### Swift

```swift
func reverse(_ x: Int) -> Int {
    var y = abs(x), ans = 0
    let boundry = x > 0 ? 1<<31 - 1 : 1<<31
    while y != 0 {
        ans = ans * 10 + y % 10
        if ans > boundry {
            return 0
        }
        y /= 10
    }
    return x > 0 ? ans : -ans
}
```

### Python

```python
def reverse(self, x: int) -> int:
    y, res = abs(x), 0
    # 则其数值范围为 [−2^31, 2^31 − 1]
    boundry = (1<<31) -1 if x>0 else 1<<31
    while y != 0:
        res = res*10 +y%10
        if res > boundry :
            return 0
        y //=10
    return res if x >0 else -res
```

## 复杂度分析

- 时间复杂度：O(X)，X为翻转的次数，即x十进制的位数
- 空间复杂度：O(1)
