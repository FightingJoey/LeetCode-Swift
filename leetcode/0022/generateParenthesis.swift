var res = [String]()

func generateParenthesis(_ n: Int) -> [String] {
    dfs("", 0, 0, n)
    return res
}
 
func dfs(_ paths: String, _ left: Int, _ right: Int, _ n: Int) {
    if paths.count == n*2 {
        res.append(paths)
        return
    }
    if left < n {
        dfs(paths + "(", left + 1, right, n)
    }
    if right < left {
        dfs(paths + ")", left, right + 1, n)
    }
}

print(generateParenthesis(2))
