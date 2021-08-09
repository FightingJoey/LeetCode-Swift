# 49. [Group Anagrams](https://leetcode.com/problems/group-anagrams)

## Question

Given an array of strings `strs`, group **the anagrams** together. You can return the answer in **any order**.

An **Anagram** is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**Example 1:**

```
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
```

**Example 2:**

```
Input: strs = [""]
Output: [[""]]
```

**Example 3:**

```
Input: strs = ["a"]
Output: [["a"]]
```

## [字母异位词分组](https://leetcode-cn.com/problems/group-anagrams)

给定一个字符串数组，将字母异位词组合在一起。可以按任意顺序返回结果列表。

字母异位词指字母相同，但排列不同的字符串。

## 解题思路

两个字符串互为字母异位词，当且仅当两个字符串包含的字母相同。同一组字母异位词中的字符串具备相同点，可以使用相同点作为一组字母异位词的标志，使用哈希表存储每一组字母异位词，哈希表的键为一组字母异位词的标志，哈希表的值为一组字母异位词列表。

遍历每个字符串，对于每个字符串，得到该字符串所在的一组字母异位词的标志，将当前字符串加入该组字母异位词的列表中。遍历全部字符串之后，哈希表中的每个键值对即为一组字母异位词。

由于互为字母异位词的两个字符串包含的字母相同，因此对两个字符串分别进行排序之后得到的字符串一定是相同的，故可以将排序之后的字符串作为哈希表的键。

## 代码实现

### Swift

```swift
func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map: [String : [String]] = [:]
    for str in strs {
        let chars = Array(str).sorted()
        let key = String(chars)
        if let _ = map[key] {
            map[key]?.append(str)
        } else {
            let list = [str]
            map[key] = list
        }
    }
    return Array(map.values)
}
print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
```

### Python

```python
import collections
def groupAnagrams(strs: [str]) -> [[str]]:
    mp = collections.defaultdict(list)
    for st in strs:
        key = "".join(sorted(st))
        mp[key].append(st)
    
    return list(mp.values())

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
```

## 复杂度分析

- 时间复杂度：*O*(n*k*log*k*)，其中 n 是 strs 中的字符串的数量，k 是 strs 中的字符串的的最大长度。
- 空间复杂度：O(nk)