def divide(dividend: int, divisor: int) -> int:
    sign = 1
    if divisor < 0 and dividend < 0:
        sign = 1
    elif divisor < 0 or dividend < 0:
        sign = -1

    divisor = abs(divisor)
    dividend = abs(dividend)

    remain = dividend  # 余数
    result = 0  # 商
    while remain >= divisor: 
        cur = 1 # 倍增商
        div = divisor # 倍增值
        while div + div < remain:
            cur += cur 
            div += div 
        remain -= div  # 余数递减
        result += cur  # 商值累计
    
    if sign==-1:
        result = -result

    return 2**31-1 if result >= 2**31 else result

print(divide(10, 3))