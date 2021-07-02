# 17. [Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

## Question

Given a string containing digits from `2-9` inclusive, return all possible letter combinations that the number could represent. Return the answer in **any order**.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![img](https://assets.leetcode-cn.com/aliyun-lc-upload/original_images/17_telephone_keypad.png)

**Example 1:**

```
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
```

**Example 2:**

```
Input: digits = ""
Output: []
```

**Example 3:**

```
Input: digits = "2"
Output: ["a","b","c"]
```

**Constraints:**

- `0 <= digits.length <= 4`
- `digits[i]` is a digit in the range `['2', '9']`.

## [电话号码的字母组合](https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number)

给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

## 解题思路

首先使用哈希表存储每个数字对应的所有可能的字母，然后进行回溯操作。

## 代码实现

### Swift

```swift
class Solution {
    let phoneMap: [Character: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        var result = [String]()
        backtrack("", Array(digits), 0, &result)
        return result
    }
    
    func backtrack(_ s: String, _ digits: [Character], _ index: Int, _ result: inout [String]) {
        //1. 退出条件
        if index == digits.count {
            result.append(s)
            return
        }
        
        let letters = phoneMap[digits[index]]!
        for item in letters {
            backtrack(s+String(item), digits, index + 1, &result)
        }
    }
}
```

### Python

```python
def letterCombinations(digits: str) -> [str]:
    if not digits:
        return list()
    
    phoneMap = {
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz",
    }

    def backtrack(index: int):
        if index == len(digits):
            combinations.append("".join(combination))
        else:
            digit = digits[index]
            for letter in phoneMap[digit]:
                combination.append(letter)
                backtrack(index + 1)
                combination.pop()

    combination = list()
    combinations = list()
    backtrack(0)
    return combinations

print(letterCombinations("23"))
```

## 复杂度分析

- 时间复杂度：*O*(3*m*×4*n*)，其中 m 是输入中对应 3 个字母的数字个数（包括数字 2、3、4、5、6、8），n 是输入中对应 4 个字母的数字个数（包括数字 7、9），m+n 是输入数字的总个数。
- 空间复杂度：*O*(*m*+*n*)