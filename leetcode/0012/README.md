# 12. [Integer to Roman](https://leetcode.com/problems/integer-to-roman/)

## Question

Roman numerals are represented by seven different symbols: `I`, `V`, `X`, `L`, `C`, `D` and `M`.

```
Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
```

For example, `2` is written as `II` in Roman numeral, just two one's added together. `12` is written as `XII`, which is simply `X + II`. The number `27` is written as `XXVII`, which is `XX + V + II`.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not `IIII`. Instead, the number four is written as `IV`. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as `IX`. There are six instances where subtraction is used:

- `I` can be placed before `V` (5) and `X` (10) to make 4 and 9. 
- `X` can be placed before `L` (50) and `C` (100) to make 40 and 90. 
- `C` can be placed before `D` (500) and `M` (1000) to make 400 and 900.

Given an integer, convert it to a roman numeral.

**Example 1:**

```
Input: num = 3
Output: "III"
```

**Example 2:**

```
Input: num = 4
Output: "IV"
```

**Example 3:**

```
Input: num = 9
Output: "IX"
```

**Example 4:**

```
Input: num = 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.
```

**Example 5:**

```
Input: num = 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

**Constraints:**

- `1 <= num <= 3999`

## [中文题目](https://leetcode-cn.com/problems/integer-to-roman/)

罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。

```
字符          数值
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
```

例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

- I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
- X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。 
- C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。

给你一个整数，将其转为罗马数字。

## 解题思路

罗马数字由 7 个不同的单字母符号组成，每个符号对应一个具体的数值。此外，减法规则（如问题描述中所述）给出了额外的 6 个复合符号。这给了我们总共 13 个独特的符号（每个符号由 1 个或 2 个字母组成），如下图所示。

![Integer to roman](https://assets.leetcode-cn.com/solution-static/12/1.png)

### 方法一：模拟

根据罗马数字的唯一表示法，为了表示一个给定的整数 num，我们寻找不超过 num 的最大符号值，将 num 减去该符号值，然后继续寻找不超过 num 的最大符号值，将该符号拼接在上一个找到的符号之后，循环直至 num 为 0。最后得到的字符串即为 num 的罗马数字表示。

### 方法二：硬编码数字

回顾前言中列出的这 13 个符号，可以发现：

千位数字只能由 M 表示；
百位数字只能由 C，CD，D 和 CM 表示；
十位数字只能由 X，XL，L 和 XC 表示；
个位数字只能由 I，IV，V 和 IX 表示。
这恰好把这 13 个符号分为四组，且组与组之间没有公共的符号。因此，整数 num 的十进制表示中的每一个数字都是可以单独处理的。

进一步地，我们可以计算出每个数字在每个位上的表示形式，整理成一张硬编码表。如下图所示，其中 0 对应的是空字符串。

![](https://assets.leetcode-cn.com/solution-static/12/3.png)

利用模运算和除法运算，我们可以得到 num 每个位上的数字：

```
thousands_digit = num / 1000
hundreds_digit = (num % 1000) / 100
tens_digit = (num % 100) / 10
ones_digit = num % 10
```

最后，根据 num 每个位上的数字，在硬编码表中查找对应的罗马字符，并将结果拼接在一起，即为 num 对应的罗马数字。

## 代码实现

### Swift

```swift
func intToRoman(_ num: Int) -> String {
    var num = num
    
    let symbols = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I"),
    ]
    
    var roman = [String]()
    for (value, symbol) in symbols {
        while num >= value {
            num -= value
            roman.append(symbol)
        }
        if num == 0 {
            break
        }
    }
    
    return roman.reduce("") { str, symbol in
        str + symbol
    }
}

func intToRoman2(_ num: Int) -> String {
    let THOUSANDS = ["", "M", "MM", "MMM"]
    let HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    let TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    let ONES = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

    return THOUSANDS[num / 1000] + HUNDREDS[num % 1000 / 100] + TENS[num % 100 / 10] + ONES[num % 10]
}

print(intToRoman(122))
```

### Python

```python
def intToRoman(num: int) -> str:
    symbols = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I"),
    ]
    roman = list()
    for value, symbol in symbols:
        while num >= value:
            num -= value
            roman.append(symbol)
        if num == 0:
            break
    return "".join(roman)

def intToRoman2(num: int) -> str:
    THOUSANDS = ["", "M", "MM", "MMM"]
    HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    ONES = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    return THOUSANDS[num // 1000] + \
        HUNDREDS[num % 1000 // 100] + \
        TENS[num % 100 // 10] + \
        ONES[num % 10]
  
print(intToRoman(122))
```

## 复杂度分析

### 方法一

- 时间复杂度：O(1)。由于 symbols 长度是固定的，且这 13 字符中的每个字符的出现次数均不会超过 3，因此循环次数有一个确定的上限。对于本题给出的数据范围，循环次数不会超过 15 次。
- 空间复杂度：O(1)。

### 方法二

- 时间复杂度：O(1)。计算量与输入数字的大小无关。
- 空间复杂度：O(1)。
