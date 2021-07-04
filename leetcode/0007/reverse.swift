func reverse(_ x: Int) -> Int {
    var y = abs(x), ans = 0
    let boundry = x > 0 ? 1<<31 - 1 : 1<<31
    while y != 0 {
        ans = ans * 10 + y % 10
        if ans > boundry {
            return 0
        }
        y /= 10
    }
    return x > 0 ? ans : -ans
}
