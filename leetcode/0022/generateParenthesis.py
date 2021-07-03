def generateParenthesis(n) -> [str]:
    res = []

    def dfs(paths, left, right):
        if len(paths) == n * 2:  # 因为括号都是成对出现的
            res.append(paths)
            return
        if left < n:
            dfs(paths + '(', left + 1, right)
        if right < left:
            dfs(paths + ')', left, right + 1)
            
    dfs('', 0, 0)
    return res

print(generateParenthesis(3))