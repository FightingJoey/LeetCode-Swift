# 41. [First Missing Positive](https://leetcode.com/problems/first-missing-positive)

## Question

Given an unsorted integer array `nums`, find the smallest missing positive integer.

You must implement an algorithm that runs in `O(n)` time and uses constant extra space.

**Example 1:**

```
Input: nums = [1,2,0]
Output: 3
```

**Example 2:**

```
Input: nums = [3,4,-1,1]
Output: 2
```

**Example 3:**

```
Input: nums = [7,8,9,11,12]
Output: 1
```

**Constraints:**

- `1 <= nums.length <= 5 * 105`
- `-231 <= nums[i] <= 231 - 1`

## [缺失的第一个正数](https://leetcode-cn.com/problems/first-missing-positive)

给你一个未排序的整数数组 `nums` ，请你找出其中没有出现的最小的正整数。

请你实现时间复杂度为 `O(n)` 并且只使用常数级别额外空间的解决方案。

## 解题思路

方法一：哈希表

方法二：排序，找到第一个突变元素

方法三：将数组看为哈希表

## 代码实现

### Swift

#### 方法一：哈希表

```swift
func firstMissingPositive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 1
    }
    var hashTable = Set<Int>()
    let n = nums.count
    for num in nums {
        hashTable.insert(num)
    }
    for i in 1..<n {
        if !hashTable.contains(i) {
            return i
        }
    }
    return n + 1
}
```

#### 方法二：排序，找到第一个突变元素

```swift
func firstMissingPositive1(_ nums: [Int]) -> Int {
    let list = nums.sorted()
    var last = 0
    var num = 1
    for i in 0..<list.count {
        if num == list[i] {
            last = list[i]
            num += 1
        } else {
            if list[i] > 0 && list[i] != last {
                return num
            }
        }
    }
    return num
}

func firstMissingPositive2(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    // 遍历找到第一个突变的元素
    var pre = 0;
    for i in 0..<nums.count {
        if (nums[i] <= 0 || nums[i] == pre) {
            continue;  // 跳过非正整数和重复值
        } else if (nums[i] > pre + 1) {
            break;  // 找到第一个突变的元素
        }
        pre += 1;  // nums[i] == pre + 1
    }
    return pre + 1;
}
```

#### 方法三：将数组看为哈希表

```swift
// 置换
func firstMissingPositive(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 1
    }
    var nums = nums
    for i in 0..<nums.count {
        // 注意：nums[i] <= nums.count的判断要放在前边，防止数组越界
        while nums[i] > 0 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
            nums.swapAt(nums[i] - 1, i)
        }
    }
    for i in 0..<nums.count {
        if nums[i] != i + 1 {
            return i + 1
        }
    }
    return nums.count + 1
}

  // 打标记
  func firstMissingPositive(_ nums: [Int]) -> Int {
      var nums = nums
    guard nums.count > 0 else {
        return 1
    }
    let n = nums.count
    nums = nums.map { (num) in
        num <= 0 ? n + 1 : num
    }
    for i in 0..<n {
        let num = abs(nums[i]);
        if (num <= n) {
            nums[num - 1] = -abs(nums[num - 1]);
        }
    }
    for i in 0..<n {
        if nums[i] > 0 {
            return i + 1
        }
    }
    return n + 1
}
```

### Python

#### 方法一：哈希表

```python
def firstMissingPositive(nums: [int]) -> int:
	if not nums:
		return 1
	n = len(nums)
	table = set()
	for num in nums:
		table.add(num)
	for i in range(n):
		if i == 0:
			continue
		if not i in table:
			return i
	return n+1
```

#### 方法二：排序，找到第一个突变元素

```python
def firstMissingPositive1(nums: [int]) -> int:
	if not nums:
		return 1
	nums.sort()
	last = 0
	num = 1
	for i in range(len(nums)):
		if num == nums[i]:
			last = nums[i]
			num += 1
		else:
			if nums[i] > 0 and nums[i] != last:
				return num
	return num

def firstMissingPositive2(nums: [int]) -> int:
	if not nums:
		return 1
	nums.sort()
	pre = 0
	for i in range(len(nums)):
		if nums[i] <= 0 or nums[i] == pre:
			continue
		elif nums[i] > pre + 1:
			break
		pre += 1
	return pre + 1
```

#### 方法三：将数组看为哈希表

```python
def firstMissingPositive3(nums: [int]) -> int:
	if not nums:
		return 1
	for i in range(len(nums)):
		while nums[i] > 0 and nums[i] <= len(nums) and nums[nums[i]-1] != nums[i]:
			nums[nums[i]-1], nums[i] = nums[i], nums[nums[i]-1]
	for i in range(len(nums)):
		if nums[i] != i+1:
			return i+1
	return len(nums)+1

def firstMissingPositive4(nums: [int]) -> int:
	if not nums:
		return 1
	n = len(nums)
	for i in range(n):
		nums[i] = n+1 if nums[i] <= 0 else nums[i]
	for i in range(n):
		num = abs(nums[i])
		if num <= n:
			nums[num-1] = -abs(nums[num-1])
	for i in range(n):
		if nums[i] > 0:
			return i+1
	return n+1
```

## 复杂度分析

### 方法 一

- 时间复杂度：O(n)，这里 n 表示数组的长度。第 1 次遍历了数组，第 2 次遍历了区间 [1, len] 里的元素。
- 空间复杂度：O(n)，把 n 个数存在哈希表里面，使用了 n 个空间。

### 方法二

- 时间复杂度：O(n logn)，排序的平均时间复杂度为 O(n logn)，查找的平均时间复杂度为 O(n)
- 空间复杂度：O(1)

### 方法三

- 时间复杂度：O(n)，其中 n 是数组的长度。
- 空间复杂度：O(1)