def longestValidParentheses(s: str) -> int:
	result = 0
	stack = list()
	stack.append(-1)
	for i in range(len(s)):
		if s[i] == "(":
			stack.append(i)
		else:
			stack.pop()
			if not stack:
				stack.append(i)
			else:
				top = len(stack)-1
				result = max(result, i - stack[top])
	return result

def longestValidParentheses2(s: str) -> int:
	left, right, maxLength = 0, 0, 0
	for i in range(len(s)):
		if s[i] == '(':
			left += 1
		else:
			right += 1
		if left == right:
			maxLength = max(maxLength, 2*right)
		elif right > left:
			left, right = 0, 0
	left, right = 0, 0
	for i in range(len(s)):
		index = len(s)-1-i
		if s[index] == "(":
			left += 1
		else:
			right += 1
		if left == right:
			maxLength = max(maxLength, 2*right)
		elif left > right:
			left, right = 0, 0
	return maxLength

print(longestValidParentheses2("()(()"))