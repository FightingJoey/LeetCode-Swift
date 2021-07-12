import Foundation

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    var sign = 1
    if divisor < 0 && dividend < 0 {
        sign = 1
    } else if divisor < 0 || dividend < 0 {
        sign = -1
    }
    
    let dividend = abs(dividend)
    let divisor = abs(divisor)
    var remain = dividend
    var result = 0
    while remain >= divisor {
        var cur = 1
        var div = divisor
        while div + div < remain {
            cur += cur
            div += div
        }
        remain -= div
        result += cur
    }
    
    result = sign == -1 ? 0 - result : result
    
    let max: Double = pow(2, 31)
    return result >= Int(max) ? Int(max) - 1 : result
}
