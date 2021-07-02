def intToRoman(num: int) -> str:
    symbols = [
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
    roman = list()
    for value, symbol in symbols:
        while num >= value:
            num -= value
            roman.append(symbol)
        if num == 0:
            break
    return "".join(roman)

def intToRoman2(num: int) -> str:
    THOUSANDS = ["", "M", "MM", "MMM"]
    HUNDREDS = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
    TENS = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
    ONES = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
    return THOUSANDS[num // 1000] + \
        HUNDREDS[num % 1000 // 100] + \
        TENS[num % 100 // 10] + \
        ONES[num % 10]

print(intToRoman(122))