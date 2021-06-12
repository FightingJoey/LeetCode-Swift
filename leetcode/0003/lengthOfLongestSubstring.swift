func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    var list: Array<Character> = []
    var ans = 0
    for char in s {
        if let firstIndex = list.firstIndex(of: char) {
            list = Array(list[firstIndex+1..<list.endIndex])
            list.append(char)
        } else {
            list.append(char)
            ans = ans < list.count ? list.count : ans
        }
        print(list)
    }
    return ans
}

let res = lengthOfLongestSubstring("pwwkew")
print(res)
