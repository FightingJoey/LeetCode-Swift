def findSubstring(s: str, words: [str]) -> [int]:
    if not words:return []
    w_len, s_len = len(words[0]), len(s)
    t_len = w_len * len(words)  # 子串的长度

    word_dict = {}  # words的哈希表
    for word in words:
        word_dict[word] = word_dict.get(word, 0) + 1

    ans = []
    for offset in range(w_len):
        lo, lo_max = offset, s_len - t_len
        while lo <= lo_max:
            tmp_dict = word_dict.copy()
            match = True
            # 从尾到头搜索单词
            for hi in range(lo + t_len, lo, -w_len): 
                # 切割出一个单词
                word = s[hi - w_len: hi]
                # 如果这个单词不在tmp_dict中
                if word not in tmp_dict or tmp_dict.get(word, 0) == 0:
                    match = False
                    break   # 当前单词不符合要求 直接停止这个子串的搜索
                tmp_dict[word] -= 1 # 如果在
            if match:
                ans.append(lo)
            lo = hi # 对lo直接赋值
    return ans

print(findSubstring("barfoothefoobarman", ["foo", "bar"]))
