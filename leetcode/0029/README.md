# 29. [Divide Two Integers](https://leetcode.com/problems/divide-two-integers)

## Question

Given two integers `dividend` and `divisor`, divide two integers without using multiplication, division, and mod operator.

Return the quotient after dividing `dividend` by `divisor`.

The integer division should truncate toward zero, which means losing its fractional part. For example, `truncate(8.345) = 8` and `truncate(-2.7335) = -2`.

**Note:** Assume we are dealing with an environment that could only store integers within the **32-bit** signed integer range: `[−231, 231 − 1]`. For this problem, assume that your function **returns** `231 − 1` **when the division result overflows**.

**Example 1:**

```
Input: dividend = 10, divisor = 3
Output: 3
Explanation: 10/3 = truncate(3.33333..) = 3.
```

**Example 2:**

```
Input: dividend = 7, divisor = -3
Output: -2
Explanation: 7/-3 = truncate(-2.33333..) = -2.
```

**Example 3:**

```
Input: dividend = 0, divisor = 1
Output: 0
```

**Example 4:**

```
Input: dividend = 1, divisor = 1
Output: 1
```

**Constraints:**

- `-231 <= dividend, divisor <= 231 - 1`
- `divisor != 0`

## [两数相除](https://leetcode-cn.com/problems/divide-two-integers/)

给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

返回被除数 dividend 除以除数 divisor 得到的商。

整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2

## 解题思路

倍增法

## 代码实现

### Swift

```swift
import Foundation

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    var sign = 1
    if divisor < 0 && dividend < 0 {
        sign = 1
    } else if divisor < 0 || dividend < 0 {
        sign = -1
    }
    
    let dividend = abs(dividend)
    let divisor = abs(divisor)
    var remain = dividend
    var result = 0
    while remain >= divisor {
        var cur = 1
        var div = divisor
        while div + div < remain {
            cur += cur
            div += div
        }
        remain -= div
        result += cur
    }
    
    result = sign == -1 ? 0 - result : result
    
    let max: Double = pow(2, 31)
    return result >= Int(max) ? Int(max) - 1 : result
}
```

### Python

```python
def divide(dividend: int, divisor: int) -> int:
    sign = 1
    if divisor < 0 and dividend < 0:
        sign = 1
    elif divisor < 0 or dividend < 0:
        sign = -1

    divisor = abs(divisor)
    dividend = abs(dividend)

    remain = dividend  # 余数
    result = 0  # 商
    while remain >= divisor: 
        cur = 1 # 倍增商
        div = divisor # 倍增值
        while div + div < remain:
            cur += cur 
            div += div 
        remain -= div  # 余数递减
        result += cur  # 商值累计
    
    if sign==-1:
        result = -result

    return 2**31-1 if result >= 2**31 else result

print(divide(10, 3))
```

## 复杂度分析

- 时间复杂度：O(log n/m)，n 是 除数，m 是被除数
- 空间复杂度：O(1)