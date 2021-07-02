func romanToInt(_ s: String) -> Int {
    let hashTable:[Character: Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    var sum = 0
    var last = 0
    for char in s {
        if let cur = hashTable[char] {
            if (cur > last) {
                sum = sum - 2*last + cur
            } else {
                sum = sum + cur
            }
            last = cur
        }
        
    }
    return sum
}

print(romanToInt("XC"))
