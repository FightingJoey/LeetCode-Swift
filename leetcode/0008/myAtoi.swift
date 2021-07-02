func myAtoi(_ s: String) -> Int {
    var sign = 1
    var res = 0
    var foundDigit = false
    var foundSign = false

    for char in s {
        if char == " " {
            if foundDigit || foundSign {
                break
            }
            continue
        }
        if char == "+" || char == "-" {
            if foundDigit || foundSign {
                break
            }
            foundSign = true
            sign = char == "-" ? -1 : 1
            continue
        }
        guard let n = char.wholeNumberValue else {
            break
        }
        foundDigit = true
        if res * 10 + n > Int(Int32.max) {
            res = Int(Int32.max)
            res += sign == 1 ? 0 : 1
            break
        }
        res = res * 10 + n
    }
    return res * sign
}
