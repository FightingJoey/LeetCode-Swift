# 43. [Multiply Strings](https://leetcode.com/problems/multiply-strings)

## Question

Given two non-negative integers `num1` and `num2` represented as strings, return the product of `num1` and `num2`, also represented as a string.

**Note:** You must not use any built-in BigInteger library or convert the inputs to integer directly.

**Example 1:**

```
Input: num1 = "2", num2 = "3"
Output: "6"
```

**Example 2:**

```
Input: num1 = "123", num2 = "456"
Output: "56088"
```

**Constraints:**

- `1 <= num1.length, num2.length <= 200`
- `num1` and `num2` consist of digits only.
- Both `num1` and `num2` do not contain any leading zero, except the number `0` itself.

## [字符串相乘](https://leetcode-cn.com/problems/multiply-strings)

给定两个以字符串形式表示的非负整数 `num1` 和 `num2`，返回 `num1` 和 `num2` 的乘积，它们的乘积也表示为字符串形式。

> **不能使用任何标准库的大数类型（比如 BigInteger）**或**直接将输入转换为整数来处理**。

## 解题思路

[做乘法](https://leetcode-cn.com/problems/multiply-strings/solution/zi-fu-chuan-xiang-cheng-by-leetcode-solution/)

## 代码实现

### Swift

```swift
func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }
    let num1: [Character] = Array(num1)
    let num2: [Character] = Array(num2)
        
    let m = num1.count, n = num2.count
    var ansArr = [Int](repeating: 0, count: m + n)
    for i in (0...m-1).reversed() {
        let x = Int(String(num1[i]))
        for j in 0...n-1 {
            let y = Int(String(num2[j]))
            ansArr[i + j + 1] += (x ?? 1) * (y ?? 1)
        }
    }
    
    for i in (1...m+n-1).reversed() {
        ansArr[i-1] += ansArr[i] / 10
        ansArr[i] %= 10
    }
    if ansArr[0] == 0 {
        ansArr.removeFirst()
    }
    let res = ansArr.map(String.init)
    return res.joined()
}
print(multiply("1234", "567"))
```

### Python

```python
def multiply(num1: str, num2: str) -> str:
    if num1 == "0" or num2 == "0":
        return "0"
    
    m, n = len(num1), len(num2)
    ansArr = [0] * (m + n)
    for i in range(m - 1, -1, -1):
        x = int(num1[i])
        for j in range(n - 1, -1, -1):
            ansArr[i + j + 1] += x * int(num2[j])

    for i in range(m + n - 1, 0, -1):
        ansArr[i - 1] += ansArr[i] // 10
        ansArr[i] %= 10

    index = 1 if ansArr[0] == 0 else 0
    ans = "".join(str(x) for x in ansArr[index:])
    return ans

print(multiply("1234", "567"))
```

## 复杂度分析

- 时间复杂度：O(mn)，其中 m 和 n 分别是 num1 和 num2 的长度。
- 空间复杂度：O(m+n)

