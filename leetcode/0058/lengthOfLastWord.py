def lengthOfLastWord(s: str) -> int:
	count = 0
	for c in range(len(s)-1, -1, -1):
		if s[c] == " ":
			if count == 0:
				continue
			else:
				break
		else:
			count += 1
	return count

print(lengthOfLastWord("s"))