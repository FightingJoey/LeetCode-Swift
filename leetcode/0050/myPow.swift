func myPow(_ x: Double, _ n: Int) -> Double {
    if n >= 0 {
        return quickMul(x, n)
    } else {
        return 1/quickMul(x, -n)
    }
}

func quickMul(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1.0
    }
    let y = quickMul(x, n / 2)
    if n%2 == 0 {
        return y * y
    } else {
        return y * y * x
    }
}

func myPow2(_ x: Double, _ n: Int) -> Double {
    var N = abs(n)
    var ans = 1.0
    var x_c = x
    while N > 0 {
        if N % 2 == 1 {
            ans *= x_c
        }
        x_c *= x_c
        N = N / 2
    }
    return n >= 0 ? ans : 1/ans
}
