func isValid(_ s: String) -> Bool {
    guard s.count % 2 == 0 else {
        return false
    }
    let pairs = [")": "(",
                 "]": "[",
                 "}": "{"]
    var stack = [String]()
    for ch in s {
        if let _ = pairs[String(ch)] {
            if stack.count == 0 || stack.last != pairs[String(ch)]  {
                return false
            }
            stack.popLast()
        } else {
            stack.append(String(ch))
        }
    }
    return stack.count == 0
}

print(isValid("([}}])"))
