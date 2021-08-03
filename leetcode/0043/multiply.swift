func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }
    let num1: [Character] = Array(num1)
    let num2: [Character] = Array(num2)
        
    let m = num1.count, n = num2.count
    var ansArr = [Int](repeating: 0, count: m + n)
    for i in (0...m-1).reversed() {
        let x = Int(String(num1[i]))
        for j in 0...n-1 {
            let y = Int(String(num2[j]))
            ansArr[i + j + 1] += (x ?? 1) * (y ?? 1)
        }
    }
    
    for i in (1...m+n-1).reversed() {
        ansArr[i-1] += ansArr[i] / 10
        ansArr[i] %= 10
    }
    if ansArr[0] == 0 {
        ansArr.removeFirst()
    }
    let res = ansArr.map(String.init)
    return res.joined()
}
print(multiply("1234", "567"))
