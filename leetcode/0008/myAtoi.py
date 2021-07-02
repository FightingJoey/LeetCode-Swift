def myAtoi(s: str) -> int:
    # 移除前导空格
    s = s.strip()
    flag = 1
    res = ''
    for i in range(len(s)):
        # 检查首字符是否为符号
        if i == 0 and s[i] in ['-', '+']:
            flag = -1 if s[i] == '-' else 1
            continue
        # 判断是否是数字
        if s[i].isdigit():
            res += s[i]
        else:
            break
    if res == '':
        res = 0
    res = flag * int(res)
    return min(res, 2**31 - 1) if flag == 1 else max(res, -2**31)

print(myAtoi('-123'))