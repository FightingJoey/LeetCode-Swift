# -*- coding: utf-8 -*-

def twoSum(nums, target):
    hashTable={}
    for i,num in enumerate(nums):
        if hashTable.get(target - num) is not None:
            return [hashTable.get(target - num), i]
        hashTable[num] = i

result = twoSum([2,7,11,15], 9)
print(result)