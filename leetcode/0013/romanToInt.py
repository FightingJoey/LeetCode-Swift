def romanToInt(s: str) -> int:
    d = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    sum = 0
    num = len(s)
    for i in range(num):
        if i < num - 1 and d[s[i]] < d[s[i + 1]]:
            sum -= d[s[i]]
        else:
            sum += d[s[i]]
    return sum

print(romanToInt('XCIII'))