func intToRoman(_ num: Int) -> String {
    var num = num
    
    let symbols = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I"),
    ]
    
    var roman = [String]()
    for (value, symbol) in symbols {
        while num >= value {
            num -= value
            roman.append(symbol)
        }
        if num == 0 {
            break
        }
    }
    
    return roman.reduce("") { str, symbol in
        str + symbol
    }
}

func intToRoman2(_ num: Int) -> String {
    let THOUSANDS = ["", "M", "MM", "MMM"]
    let HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    let TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    let ONES = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

    return THOUSANDS[num / 1000] + HUNDREDS[num % 1000 / 100] + TENS[num % 100 / 10] + ONES[num % 10]
}

print(intToRoman(122))
