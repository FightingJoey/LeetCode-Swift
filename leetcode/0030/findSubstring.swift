func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    if words.count == 0 {
        return []
    }
    let w_len = words[0].count, s_len = s.count
    let total_len = w_len * words.count // 子串的长度
    var wordDict = [String: Int]()
    for word in words {
        if let num = wordDict[word] {
            wordDict[word] = num + 1
        } else {
            wordDict[word] = 1
        }
    }
        
    var ans = [Int]()
    for offset in 0..<w_len {
        var leftOffset = offset
        let offsetMax = s_len - total_len
        while leftOffset <= offsetMax {
            var tempDict = wordDict
            var match = true
            
            var range = [Int]()
            var top = leftOffset + total_len
            while top > leftOffset {
                range.append(top)
                top -= w_len
            }
            
            var tempOffset = 0
            for hi in range {
                tempOffset = hi
                let word = s[hi-w_len, hi]
                if let num = tempDict[word] {
                    if num == 0 {
                        match = false
                        break
                    } else {
                        tempDict[word]! -= 1
                    }
                } else {
                    match = false
                    break
                }
            }
            if match {
                ans.append(leftOffset)
            }
            leftOffset = tempOffset
        }
    }
    
    return ans
}

extension String {
    subscript (left: Int, right: Int) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: left)
            let endIndex = self.index(self.startIndex, offsetBy: right)
            return String(self[startIndex..<endIndex])
        }
    }
}


print(findSubstring("barfoothefoobarman", ["foo", "bar"]))
