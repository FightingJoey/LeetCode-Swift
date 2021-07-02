def longestPalindrome(s: str) -> str:
    if len(s) < 2 or s == s[::-1]:
        return s
    maxl = 1
    res = s[0]

    for i in range(1,len(s)):
        #新窗口比旧窗口大，一个或两个
        even = s[i-maxl:i+1]
        odd = s[i-maxl-1:i+1]
        #后面判断是，边界问题，最后的回文和自己是相等的

        if odd == odd[::-1] and maxl < len(odd):
            maxl  = len(odd)
            res = odd
            continue
        if even == even[::-1] and maxl < len(even):
            maxl = len(even)
            res = even
    return res

res = longestPalindrome("babad")
print(res)