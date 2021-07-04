# 1.Add Two Numbers
## Question

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
You may assume the two numbers do not contain any leading zero, except the number 0 itself. 

**Example:**

```
Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
```

#### [两数相加](https://leetcode-cn.com/problems/add-two-numbers/)

给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

## 解题思路

同时遍历两个链表，逐位计算它们的和，并与当前位置的进位值相加，之后对应位置的值为 `sum % 10`，新的进位值为 `sum / 10`。

如果两个链表的长度不同，则可以认为长度短的链表的后面有若干个 0 。

如果链表遍历结束后，有 carry>0，还需要在答案链表的后面附加一个节点，节点的值为 carry。

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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    let pre = ListNode()
    var cur = pre
    var carry = 0
    
    while l1 != nil || l2 != nil {
        let x = l1 == nil ? 0 : l1!.val
        let y = l2 == nil ? 0 : l2!.val
        var sum = x + y + carry
        
        carry = sum / 10
        sum = sum % 10
        cur.next = ListNode(sum)
        
        cur = cur.next!
        if let l = l1 {
            l1 = l.next
        }
        if let l = l2 {
            l2 = l.next
        }
    }
    
    if carry > 0 {
        cur.next = ListNode(carry)
    }
    
    return pre.next
}

func test() {
    let l1 = ListNode(2)
    let l2 = ListNode(4)
    let l3 = ListNode(3)
    l1.next = l2
    l2.next = l3

    let r1 = ListNode(5)
    let r2 = ListNode(6)
    let r3 = ListNode(4)
    r1.next = r2
    r2.next = r3

    let result = addTwoNumbers(l1, r1)
    var temp = result
    print(temp?.val)
    while let _ = temp?.next {
        temp = temp?.next
        print(temp?.val)
    }
}

test()
```

### Python

```python
# -*- coding: utf-8 -*-

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def addTwoNumbers(l1: ListNode, l2: ListNode) -> ListNode:
    pre = ListNode(0)
    cur = pre
    carry = 0

    while l1 != None or l2 != None:
        x = 0 if l1 == None else l1.val
        y = 0 if l2 == None else l2.val
        sum = x + y + carry
        
        carry = int(sum / 10)
        sum = int(sum % 10)
        cur.next = ListNode(sum)

        cur = cur.next
        if l1 != None:
            l1 = l1.next
        if l2 != None:
            l2 = l2.next
    if carry > 0:
        cur.next = ListNode(carry)
    return pre.next

def test():
    l1 = ListNode(val=2)
    l2 = ListNode(val=4)
    l3 = ListNode(val=3)
    l1.next = l2
    l2.next = l3

    r1 = ListNode(val=5)
    r2 = ListNode(val=6)
    r3 = ListNode(val=4)
    r1.next = r2
    r2.next = r3

    result = addTwoNumbers(l1, r1)
    temp = result
    print(temp.val)
    while temp.next != None:
        temp = temp.next
        print(temp.val)

test()
```

## 复杂度分析

- 时间复杂度：O(max(m,n))，其中 m 和 n 分别为两个链表的长度。我们要遍历两个链表的全部位置，而处理每个位置只需要 O(1) 的时间。
- 空间复杂度：O(1)。
