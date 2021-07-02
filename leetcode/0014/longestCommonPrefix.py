# 横向扫描
def longestCommonPrefix(strs: [str]) -> str:
    if not strs:
        return ""
    
    prefix, count = strs[0], len(strs)
    for i in range(1, count):
        prefix = lcp(prefix, strs[i])
        if not prefix:
            break
    
    return prefix

def lcp(str1, str2):
    length, index = min(len(str1), len(str2)), 0
    while index < length and str1[index] == str2[index]:
        index += 1
    return str1[:index]

# 纵向扫描
def longestCommonPrefix2(strs: [str]) -> str:
    if not strs:
        return ""
    
    length, count = len(strs[0]), len(strs)
    for i in range(length):
        c = strs[0][i]
        if any(i == len(strs[j]) or strs[j][i] != c for j in range(1, count)):
            return strs[0][:i]
    
    return strs[0]

print(longestCommonPrefix(["flower","flow","flight"]))