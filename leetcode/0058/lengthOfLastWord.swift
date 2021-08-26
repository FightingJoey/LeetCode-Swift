func lengthOfLastWord(_ s: String) -> Int {
    var count = 0
    for i in s.reversed() {
        if i != " " {
            count += 1
        } else if count > 0 {
            return count
        }
    }
    return count
}

lengthOfLastWord("sadf sdfds")
