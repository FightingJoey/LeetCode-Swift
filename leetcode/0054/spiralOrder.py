def spiralOrder(matrix: [[int]]) -> [int]:
    if not matrix or not matrix[0]:
        return list()
    
    rows, columns = len(matrix), len(matrix[0])
    order = list()
    left, right, top, bottom = 0, columns - 1, 0, rows - 1
    while left <= right and top <= bottom:
        for column in range(left, right + 1):
            order.append(matrix[top][column])
        for row in range(top + 1, bottom + 1):
            order.append(matrix[row][right])
        if left < right and top < bottom:
            for column in range(right - 1, left, -1):
                print(column)
                order.append(matrix[bottom][column])
            for row in range(bottom, top, -1):
                print(matrix[row][left])
                order.append(matrix[row][left])
        left, right, top, bottom = left + 1, right - 1, top + 1, bottom - 1
    return order

print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))

for column in range(1, 0, -1):
    print(column)