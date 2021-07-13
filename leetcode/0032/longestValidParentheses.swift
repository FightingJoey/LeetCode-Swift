func longestValidParentheses(_ s: String) -> Int {
    var result = 0
    let strList = Array(s)
    var stack = [Int]()
    stack.append(-1)
    for i in 0..<strList.count {
        if strList[i] == "(" {
            stack.append(i)
        } else {
            stack.popLast()
            if stack.isEmpty {
                stack.append(i)
            } else {
                let top = stack.count - 1
                result = max(result, i - stack[top])
            }
        }
    }
    return result
}

func longestValidParentheses2(_ s: String) -> Int {
    var left = 0, right = 0, maxLength = 0
    let strList = Array(s)
    for i in 0..<strList.count {
        if strList[i] == "(" {
            left += 1
        } else {
            right += 1
        }
        if left == right {
            maxLength = max(maxLength, 2*right)
        } else if right > left {
            left = 0
            right = 0
        }
    }
    left = 0
    right = 0
    for i in 0..<strList.count {
        let index = strList.count-1-i
        if strList[index] == "(" {
            left += 1
        } else {
            right += 1
        }
        if left == right {
            maxLength = max(maxLength, 2*right)
        } else if left > right {
            left = 0
            right = 0
        }
    }
    return maxLength
}

print(longestValidParentheses2("(()"))

