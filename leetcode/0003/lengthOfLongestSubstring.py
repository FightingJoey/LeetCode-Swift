def lengthOfLongestSubstring(s: str) -> int:
    if not s: return 0
    if len(s) == 0: return 0
    resList = []
    ans = 0
    for i in range(len(s)):
        if s[i] in resList:
            index = resList.index(s[i])
            resList = resList[index+1:]
            resList.append(s[i])
        else:
            resList.append(s[i])
            if ans < len(resList):
                ans = len(resList)
    return ans

res = lengthOfLongestSubstring('abcabcbb')
print(res)
