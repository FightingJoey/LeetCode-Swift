# 6. [ZigZag Conversion](https://leetcode.com/problems/zigzag-conversion/)

## Question

The string `"PAYPALISHIRING"` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

```
P   A   H   N
A P L S I I G
Y   I   R
```

And then read line by line: `"PAHNAPLSIIGYIR"`

Write the code that will take a string and make this conversion given a number of rows:

```
string convert(string s, int numRows);
```

**Example 1:**

```
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```

**Example 2:**

```
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
```

**Example 3:**

```
Input: s = "A", numRows = 1
Output: "A"
```

**Constraints:**

- `1 <= s.length <= 1000`
- `s` consists of English letters (lower-case and upper-case), `','` and `'.'`.
- `1 <= numRows <= 1000`

## [Z 字形变换](https://leetcode-cn.com/problems/zigzag-conversion/)

将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。

比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：

```
P   A   H   N
A P L S I I G
Y   I   R
```

之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。

请你实现这个将字符串进行指定行数变换的函数。

## 解题思路

- 字符串 `s` 是以 Z 字形为顺序存储的字符串，目标是按行打印。
- 设 numRows 行字符串分别为 s1,s2,...,sn，则容易发现：按顺序遍历字符串 s 时，每个字符 c 在 Z 字形中对应的行索引先从 s1 增大至 sn，再从 sn 减小至 s1，如此反复。
- 因此，解决方案为：模拟这个行索引的变化，在遍历 `s` 中把每个字符填到正确的行 `res[i]`

## 代码实现

### Swift

```swift
func convert(_ s: String, _ numRows: Int) -> String {
    if numRows < 2 {
        return s
    }
    var res = [String]()
    for _ in 0..<numRows {
        res.append("")
    }
    var i = 0, flag = -1
    for c in s {
        res[i] += String(c)
        if i == 0 || i == numRows - 1 {
            flag = -flag
        }
        i += flag
    }
    return res.joined()
}
```

### Python

```python
def convert(self, s: str, numRows: int) -> str:
    if numRows < 2: return s
    res = ["" for _ in range(numRows)]
    i, flag = 0, -1
    for c in s:
        # 把每个字符 c 填入对应行 s_i
        res[i] += c
        # 在达到 Z 字形转折点时，执行反向
        if i == 0 or i == numRows - 1: flag = -flag
        # 更新当前字符 c 对应的行索引；
        i += flag
    return "".join(res)
```

## 复杂度分析

- 时间复杂度：*O*(*N*)，N为字符串长度
- 空间复杂度：O(N)，各行字符串共占用 N 个额外空间
