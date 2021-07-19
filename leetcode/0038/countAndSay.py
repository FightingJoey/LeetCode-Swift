def countAndSay(n: int) -> str:
	arr = "1"
	if n == 1:
		return arr
	for i in range(n):
		if i == 0:
			continue
		word = arr[0]
		num = 1
		temp = ""
		for j in range(len(arr)):
			if j == 0:
				continue
			if word == arr[j]:
				num += 1
			else:
				num_char = str(num)
				temp += num_char
				temp += word

				word = arr[j]
				num = 1
		num_char = str(num)
		temp += num_char
		temp += word
		arr = temp
	return arr

print(countAndSay(5))