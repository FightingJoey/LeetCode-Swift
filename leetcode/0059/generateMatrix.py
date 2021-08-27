def generateMatrix(n: int) -> [[int]]:
	matrix = [[0 for _ in range(n)] for _ in range(n)]

	left, right, top, bottom = 0, n - 1, 0, n - 1
	insert_n = 1
	while left <= right and top <= bottom:
		for column in range(left, right+1):
			matrix[top][column] = insert_n
			insert_n += 1
		for row in range(top+1, bottom+1):
			matrix[row][right] = insert_n
			insert_n += 1
		if left < right and top < bottom:
			for column in range(right - 1, left, -1):
				matrix[bottom][column] = insert_n
				insert_n += 1
			for row in range(bottom, top, -1):
				matrix[row][left] = insert_n
				insert_n += 1
		left, right, top, bottom = left + 1, right - 1, top + 1, bottom - 1
	return matrix

print(generateMatrix(3))