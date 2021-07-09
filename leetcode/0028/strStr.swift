func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle || needle.count == 0 {
        return 0
    }
    if haystack.count < needle.count{
        return -1
    }
    var a: String = haystack
    for i in 0...(a.count - needle.count) {
        if a.hasPrefix(needle) {
            return i
        }
        a.remove(at: a.startIndex)
    }
    return -1
}

print(strStr("mississippi", "issip"))
