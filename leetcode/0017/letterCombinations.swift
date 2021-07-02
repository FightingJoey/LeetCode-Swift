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

print(letterCombinations("23"))
