// 横向扫描
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var prefix: String? = strs[0]
    for i in 1..<strs.count {
        prefix = lcp(str1: prefix ?? "", str2: strs[i])
        guard let _ = prefix else {
            break
        }
    }
    return prefix ?? ""
}

// 纵向扫描
func longestCommonPrefix2(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    let length = strs[0].count
    let count = strs.count
    for i in 0..<length {
        let char = strs[0][i]
        for j in 1..<count {
            if strs[j].count == i || strs[j][i] != char {
                return String(strs[0].prefix(i))
            }
        }
    }
    return strs[0]
}

func lcp(str1: String, str2: String) -> String? {
    var index = 0
    let length = min(str1.count, str2.count)
    while index < length && str1[index] == str2[index] {
        index += 1
    }
    return String(str1.prefix(index))
}

extension String {
    subscript (i:Int)->String{
        let startIndex = self.index(self.startIndex, offsetBy: i)
        let endIndex = self.index(startIndex, offsetBy: 1)
        return String(self[startIndex..<endIndex])
    }
}

print(longestCommonPrefix(["flower","flow","flight"]))
