def threeSum(nums: [int]) -> [[int]]:
    n=len(nums)
    if(not nums or n<3):
        return []
    nums.sort()
    res=[]
    for first in range(n):
        if(nums[first]>0):
            return res
        if(first>0 and nums[first]==nums[first-1]):
            continue
        second=first+1
        three=n-1
        while(second<three):
            s = nums[first]+nums[second]+nums[three]
            if(s==0):
                res.append([nums[first],nums[second],nums[three]])
                while(second<three and nums[second]==nums[second+1]):
                    second=second+1
                while(second<three and nums[three]==nums[three-1]):
                    three=three-1
                second=second+1
                three=three-1
            elif(s>0):
                three=three-1
            else:
                second=second+1
    return res

print(threeSum([-1,0,1,2,-1,-4]))