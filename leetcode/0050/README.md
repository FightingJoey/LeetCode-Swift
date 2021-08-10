# 50. [Pow(x, n)](https://leetcode.com/problems/powx-n)

## Question

Implement [pow(x, n)](http://www.cplusplus.com/reference/valarray/pow/), which calculates `x` raised to the power `n` (i.e., `xn`).

**Example 1:**

```
Input: x = 2.00000, n = 10
Output: 1024.00000
```

**Example 2:**

```
Input: x = 2.10000, n = 3
Output: 9.26100
```

**Example 3:**

```
Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2-2 = 1/22 = 1/4 = 0.25
```

## [Pow(x, n)](https://leetcode-cn.com/problems/powx-n)

实现 [pow(*x*, *n*)](https://www.cplusplus.com/reference/valarray/pow/) ，即计算 x 的 n 次幂函数。

## 解题思路

[快速幂算法 + 递归 或 迭代](https://leetcode-cn.com/problems/powx-n/solution/powx-n-by-leetcode-solution/)

## 代码实现

### Swift

```swift
func myPow(_ x: Double, _ n: Int) -> Double {
    if n >= 0 {
        return quickMul(x, n)
    } else {
        return 1/quickMul(x, -n)
    }
}

func quickMul(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1.0
    }
    let y = quickMul(x, n / 2)
    if n%2 == 0 {
        return y * y
    } else {
        return y * y * x
    }
}

func myPow2(_ x: Double, _ n: Int) -> Double {
    var N = abs(n)
    var ans = 1.0
    var x_c = x
    while N > 0 {
        if N % 2 == 1 {
            ans *= x_c
        }
        x_c *= x_c
        N = N / 2
    }
    return n >= 0 ? ans : 1/ans
}
```

### Python

```python
def myPow(x: float, n: int) -> float:
    def quickMul(N):
        if N == 0:
            return 1.0
        y = quickMul(N // 2)
        return y * y if N % 2 == 0 else y * y * x
    
    return quickMul(n) if n >= 0 else 1.0 / quickMul(-n)

def myPow2(x: float, n: int) -> float:
    def quickMul(N):
        ans = 1.0
        # 贡献的初始值为 x
        x_contribute = x
        # 在对 N 进行二进制拆分的同时计算答案
        while N > 0:
            if N % 2 == 1:
                # 如果 N 二进制表示的最低位为 1，那么需要计入贡献
                ans *= x_contribute
            # 将贡献不断地平方
            x_contribute *= x_contribute
            # 舍弃 N 二进制表示的最低位，这样我们每次只要判断最低位即可
            N //= 2
        return ans
    
    return quickMul(n) if n >= 0 else 1.0 / quickMul(-n)
```

## 复杂度分析

### 递归

- 时间复杂度：O(logn)，即为递归的层数。
- 空间复杂度：O(logn)，即为递归的层数。这是由于递归的函数调用会使用栈空间。

### 迭代

- 时间复杂度：O(logn)，即为对 n 进行二进制拆分的时间复杂度。
- 空间复杂度：O(1)