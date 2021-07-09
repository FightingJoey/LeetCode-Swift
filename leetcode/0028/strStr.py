def strStr(haystack: str, needle: str) -> int:
    l_h = len(haystack)
    l_n = len(needle)
    if l_n == 0:
        return 0
    for i in range(l_h - l_n + 1):
        if needle == haystack[i:i+l_n]:
            return i
    return -1

print(strStr("mississippi", "issip"))