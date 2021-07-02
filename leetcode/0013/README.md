# 13. [Roman to Integer](https://leetcode.com/problems/roman-to-integer/)

## Question

Roman numerals are represented by seven different symbols: I , V , X , L , C , D and M .

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

Given a roman numeral, convert it to an integer.

**Example 1:**

```
Input: s = "III"
Output: 3
```

**Example 2:**

```
Input: s = "IV"
Output: 4
```

**Example 3:**

```
Input: s = "IX"
Output: 9
```

**Example 4:**

```
Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
```

**Example 5:**

```
Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

**Constraints:**

- `1 <= s.length <= 15`
- `s` contains only the characters `('I', 'V', 'X', 'L', 'C', 'D', 'M')`.
- It is **guaranteed** that `s` is a valid roman numeral in the range `[1, 3999]`.

## [中文题目](https://leetcode-cn.com/problems/median-of-two-sorted-arrays/)

罗马数字包含以下七种字符: I， V， X， L，C，D 和 M。

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

给定一个罗马数字，将其转换成整数。输入确保在 1 到 3999 的范围内。

## 解题思路

通常情况下，罗马数字中小的数字在大的数字的右边。若输入的字符串满足该情况，那么可以将每个字符视作一个单独的值，累加每个字符对应的数值即可。

例如 XXVII 可视作 X + X + V + I + I = 10 + 10 + 5 + 1 + 1 = 27。

若存在小的数字在大的数字的左边的情况，根据规则需要减去小的数字。对于这种情况，我们也可以将每个字符视作一个单独的值，若一个数字右侧的数字比它大，则将该数字的符号取反。

例如 XIV 可视作 X − I + V = 10 − 1 + 5 = 14。

## 代码实现

### Swift

```swift
func romanToInt(_ s: String) -> Int {
    let hashTable:[Character: Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    var sum = 0
    var last = 0
    for char in s {
        if let cur = hashTable[char] {
            if (cur > last) {
              	# 如果当前的字符比上一个字符小，那么需要减去2*last，因为之前加了一次
                sum = sum - 2*last + cur
            } else {
                sum = sum + cur
            }
            last = cur
        }
    }
    return sum
}

print(romanToInt("XC"))
```

### Python

```python
def romanToInt(s: str) -> int:
    d = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    sum = 0
    num = len(s)
    for i in range(num):
        if i < num - 1 and d[s[i]] < d[s[i + 1]]:
            sum -= d[s[i]]
        else:
            sum += d[s[i]]
    return sum

print(romanToInt('XCIII'))
```

## 复杂度分析

- 时间复杂度：*O*(n)，其中 n 是字符串 s*s* 的长度。
- 空间复杂度：*O*(1)。
