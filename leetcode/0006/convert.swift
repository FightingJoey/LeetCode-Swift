func convert(_ s: String, _ numRows: Int) -> String {
    if numRows < 2 {
        return s
    }
    var res = [String]()
    for _ in 0..<numRows {
        res.append("")
    }
    var i = 0, flag = -1
    for c in s {
        res[i] += String(c)
        if i == 0 || i == numRows - 1 {
            flag = -flag
        }
        i += flag
    }
    return res.joined()
}
