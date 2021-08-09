import collections
def groupAnagrams(strs: [str]) -> [[str]]:
    mp = collections.defaultdict(list)
    for st in strs:
        key = "".join(sorted(st))
        mp[key].append(st)
    
    return list(mp.values())

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))