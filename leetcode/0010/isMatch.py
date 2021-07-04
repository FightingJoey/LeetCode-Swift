def isMatch(self, s: str, p: str) -> bool:
    m, n = len(s), len(p)

    def matches(i: int, j: int) -> bool:
        if i == 0:
            return False
        if p[j - 1] == '.':
            return True
        return s[i - 1] == p[j - 1]

    f = [[False] * (n + 1) for _ in range(m + 1)]
    f[0][0] = True
    for i in range(m + 1):
        for j in range(1, n + 1):
            if p[j - 1] == '*':
                f[i][j] |= f[i][j - 2]
                if matches(i, j - 1):
                    f[i][j] |= f[i - 1][j]
            else:
                if matches(i, j):
                    f[i][j] |= f[i - 1][j - 1]
    return f[m][n]

def isMatch(self, s: str, p: str) -> bool:
    def dp(i,j):
        # 已记录，直接返回
        if (i, j) in hash_table:
            return hash_table[(i, j)]

        # 若模式串已扫描完，检查字符串是否剩余
        if j == len(p):
            return i == len(s)

        # 检查s[i]是否能被匹配
        matchable = i < len(s)  and p[j] in {s[i], '.'}

        if j + 1 < len(p) and p[j + 1] == "*":
            # '*'匹配0次或多次的情况
            hash_table[(i, j)] = dp(i, j + 2) or (matchable and dp(i + 1, j))
        else:
            # 直接匹配的情况
            hash_table[(i, j)] = matchable and dp(i + 1, j + 1)
        return hash_table[(i, j)]
    hash_table = {}
    return dp(0, 0)
