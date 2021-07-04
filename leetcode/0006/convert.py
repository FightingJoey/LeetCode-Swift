def convert(self, s: str, numRows: int) -> str:
    if numRows < 2: return s
    res = ["" for _ in range(numRows)]
    i, flag = 0, -1
    for c in s:
        # 把每个字符 c 填入对应行 s_i
        res[i] += c
        # 在达到 Z 字形转折点时，执行反向
        if i == 0 or i == numRows - 1: flag = -flag
        # 更新当前字符 c 对应的行索引；
        i += flag
    return "".join(res)