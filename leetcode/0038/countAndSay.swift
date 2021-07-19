func countAndSay(_ n: Int) -> String {
    var arr = ["1"]
    if n == 1 {
        return arr.joined()
    }
    for _ in 1..<n {
        var word = arr[0]
        var num = 1
        var temp: String = ""
        for j in 1..<arr.count {
            if word == arr[j] {
                num += 1
            } else {
                let numChar = "\(num)"
                temp += numChar
                temp += word
                
                word = arr[j]
                num = 1
            }
        }
        let numChar = "\(num)"
        temp += numChar
        temp += word
        arr = Array(temp).map({ c in
            String(c)
        })
    }
    return arr.joined()
}

print(countAndSay(4))
