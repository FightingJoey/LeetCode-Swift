def isPalindrome(x: int) -> bool:
    if x < 0 or (x % 10 == 0 and x != 0):
        return False

    halfNum = 0
    while x > halfNum:
        halfNum = halfNum * 10 + x % 10;
        x = int(x/10)

    return x == halfNum or x == int(halfNum / 10)

res = isPalindrome(121)
print(res)