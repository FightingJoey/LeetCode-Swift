# 23. [Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists)

## Question

You are given an array of `k` linked-lists `lists`, each linked-list is sorted in ascending order.

*Merge all the linked-lists into one sorted linked-list and return it.*

**Example 1:**

```
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6
```

**Example 2:**

```
Input: lists = []
Output: []
```

**Example 3:**

```
Input: lists = [[]]
Output: []
```

**Constraints:**

- `k == lists.length`
- `0 <= k <= 10^4`
- `0 <= lists[i].length <= 500`
- `-10^4 <= lists[i][j] <= 10^4`
- `lists[i]` is sorted in **ascending order**.
- The sum of `lists[i].length` won't exceed `10^4`.

## [合并K个升序链表](https://leetcode-cn.com/problems/merge-k-sorted-lists)

给你一个链表数组，每个链表都已经按升序排列。

请你将所有链表合并到一个升序链表中，返回合并后的链表。

## 解题思路

### 暴力求解

将k个链表中的所有元素都放入一个数组中，对数组进行排序，然后再将数组转换成链表

### 顺序合并

用一个变量result存储已经合并过的链表，遍历k个链表，逐一与result合并，合并结果保存在result中

### 分治合并

- 将 k 个链表配对并将同一对中的链表合并；
- 第一轮合并以后， k 个链表被合并成了 k/2 个链表，平均长度为 2n/k 然后是 k/4 个链表， k/8 个链表等等；
- 重复这一过程，直到我们得到了最终的有序链表。

## 代码实现

### Swift

```swift
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    let prehead = ListNode(0)
    var prev: ListNode? = prehead
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            prev?.next = l1
            l1 = l1?.next
        } else {
            prev?.next = l2
            l2 = l2?.next
        }
        prev = prev?.next
    }
    
    prev?.next = l1 != nil ? l1 : l2

    return prehead.next
}

/// 暴力求解
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var arr = [Int]()
    for item in lists {
        var subItem = item
        while subItem != nil {
            arr.append(subItem!.val)
            subItem = subItem!.next
        }
    }
    arr = arr.sorted()
    if arr.count == 0 {
        return nil
    }
    let res: ListNode? = ListNode(arr[0])
    var nextNode = res
    for i in 1..<arr.count {
        let val = arr[i]
        nextNode?.next = ListNode(val)
        nextNode = nextNode?.next
    }
    return res
}

/// 顺序合并 （超出时间限制）
//func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//    var result: ListNode? = nil
//    for i in 0..<lists.count {
//        result = mergeTwoLists(result, lists[i])
//    }
//    return result
//}

/// 分治合并
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 {
        return nil
    } else if lists.count == 1 {
        return lists[0]
    } else {
        var mid = lists.count / 2
        return mergeTwoLists(mergeKLists(Array(lists[0..<mid])), mergeKLists(Array(lists[mid..<lists.count])))
    }
}
```

### Python

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
# 暴力求解
def mergeKLists(lists: [ListNode]) -> ListNode:
    a = []
    for item in lists:
        sub_item = item
        while sub_item is not None:
            a.append(sub_item.val)
            sub_item = sub_item.next

    a = sorted(a)
    if len(a) == 0:
        return None
    res = ListNode(a[0])
    next_node = res
    for val in a[1:]:
        next_node.next = ListNode(val)
        next_node = next_node.next

    return res

def mergeTwoLists(l1: ListNode, l2: ListNode) -> ListNode:
	prehead = ListNode(0)

    prev = prehead
    while l1 and l2:
        if l1.val <= l2.val:
            prev.next = l1
            l1 = l1.next
        else:
            prev.next = l2
            l2 = l2.next            
        prev = prev.next

    prev.next = l1 if l1 is not None else l2

    return prehead.next

# 顺序合并
def mergeKLists(lists: [ListNode]) -> ListNode:
    result = ListNode(0)
    for i in range(len(lists)):
        result.next = mergeTwoLists(result, lists[i])
    return result.next

# 分治合并
def mergeKLists(lists: [ListNode]) -> ListNode:
    if len(lists) == 0:
        return None
    if len(lists) == 1:
        return lists[0]
    mid = len(lists) // 2
    left = self.mergeKLists(lists[:mid])
    right = self.mergeKLists(lists[mid:])
    return self.merge(left, right)

def merge(left, right):
    if left == None:
        return right
    if right == None:
        return left
    if left.val < right.val:
        left.next = self.merge(left.next, right)
        return left
    else:
        right.next = self.merge(left, right.next)
        return right
```

## 复杂度分析

### 暴力求解

- 时间复杂度：O(nlogn)，n是节点的总数目
- 空间复杂度：O(n)

### 顺序合并

- 时间复杂度：O(k^2 n)，n是每个链表的最长长度。
- 空间复杂度：O(1)

### 分治合并

- 时间复杂度：O*(*kn × logk)
- 空间复杂度：O(n)