# 38. [Count and Say](https://leetcode.com/problems/count-and-say)

## Question

The **count-and-say** sequence is a sequence of digit strings defined by the recursive formula:

- `countAndSay(1) = "1"`
- `countAndSay(n)` is the way you would "say" the digit string from `countAndSay(n-1)`, which is then converted into a different digit string.

To determine how you "say" a digit string, split it into the **minimal** number of groups so that each group is a contiguous section all of the **same character.** Then for each group, say the number of characters, then say the character. To convert the saying into a digit string, replace the counts with a number and concatenate every saying.

For example, the saying and conversion for digit string `"3322251"`:

![img](https://assets.leetcode.com/uploads/2020/10/23/countandsay.jpg)

Given a positive integer `n`, return *the* `nth` *term of the **count-and-say** sequence*.

**Example 1:**

```
Input: n = 1
Output: "1"
Explanation: This is the base case.
```

**Example 2:**

```
Input: n = 4
Output: "1211"
Explanation:
countAndSay(1) = "1"
countAndSay(2) = say "1" = one 1 = "11"
countAndSay(3) = say "11" = two 1's = "21"
countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"
```

**Constraints:**

- `1 <= n <= 30`

## [外观数列](https://leetcode-cn.com/problems/count-and-say)

给定一个正整数 n ，输出外观数列的第 n 项。

「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。

你可以将其视作是由递归公式定义的数字字符串序列：

- countAndSay(1) = "1"
- countAndSay(n) 是对 countAndSay(n-1) 的描述，然后转换成另一个数字字符串。

前五项如下：

```
1.     1
2.     11
3.     21
4.     1211
5.     111221
第一项是数字 1 
描述前一项，这个数是 1 即 “ 一 个 1 ”，记作 "11"
描述前一项，这个数是 11 即 “ 二 个 1 ” ，记作 "21"
描述前一项，这个数是 21 即 “ 一 个 2 + 一 个 1 ” ，记作 "1211"
描述前一项，这个数是 1211 即 “ 一 个 1 + 一 个 2 + 二 个 1 ” ，记作 "111221"
```

要 描述 一个数字字符串，首先要将字符串分割为 最小 数量的组，每个组都由连续的最多 相同字符 组成。然后对于每个组，先描述字符的数量，然后描述字符，形成一个描述组。要将描述转换为数字字符串，先将每组中的字符数量用数字替换，再将所有描述组连接起来。

例如，数字字符串 `"3322251"` 的描述如下图：

![img](https://assets.leetcode.com/uploads/2020/10/23/countandsay.jpg)

## 解题思路

从n=1开始，依次计算 n=i 时的外观数列，每次只用遍历一遍当前的外观数列 arr。

遍历 arr 外观数列时，记录当前数字 word 以及它连续出现的个数 num。当出现不一样的数字时，记下原来的数字 word 以及出现次数 num，然后重置这两个变量。

重复上述操作，直到所有数字都被扫描过。

## 代码实现

### Swift

```swift
func countAndSay(_ n: Int) -> String {
    var arr = ["1"]
    if n == 1 {
        return arr.joined()
    }
    for _ in 1..<n {
        var word = arr[0]
        var num = 1
        var temp: String = ""
        for j in 1..<arr.count {
            if word == arr[j] {
                num += 1
            } else {
                let numChar = "\(num)"
                temp += numChar
                temp += word
                
                word = arr[j]
                num = 1
            }
        }
        let numChar = "\(num)"
        temp += numChar
        temp += word
        arr = Array(temp).map({ c in
            String(c)
        })
    }
    return arr.joined()
}

print(countAndSay(4))
```

### Python

```python
def countAndSay(n: int) -> str:
	arr = "1"
	if n == 1:
		return arr
	for i in range(n):
		if i == 0:
			continue
		word = arr[0]
		num = 1
		temp = ""
		for j in range(len(arr)):
			if j == 0:
				continue
			if word == arr[j]:
				num += 1
			else:
				num_char = str(num)
				temp += num_char
				temp += word

				word = arr[j]
				num = 1
		num_char = str(num)
		temp += num_char
		temp += word
		arr = temp
	return arr

print(countAndSay(5))
```

## 复杂度分析

- 时间复杂度：O(1)
- 空间复杂度：O(1)