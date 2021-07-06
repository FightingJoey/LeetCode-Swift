# 25. [Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group)

## Question

Given a linked list, reverse the nodes of a linked list *k* at a time and return its modified list.

*k* is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of *k* then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2020/10/03/reverse_ex1.jpg)

```
Input: head = [1,2,3,4,5], k = 2
Output: [2,1,4,3,5]
```

**Example 2:**

![img](https://assets.leetcode.com/uploads/2020/10/03/reverse_ex2.jpg)

```
Input: head = [1,2,3,4,5], k = 3
Output: [3,2,1,4,5]
```

**Example 3:**

```
Input: head = [1,2,3,4,5], k = 1
Output: [1,2,3,4,5]
```

**Example 4:**

```
Input: head = [1], k = 1
Output: [1]
```

**Constraints:**

- The number of nodes in the list is in the range `sz`.
- `1 <= sz <= 5000`
- `0 <= Node.val <= 1000`
- `1 <= k <= sz`

**Follow-up:** Can you solve the problem in O(1) extra memory space?

## [K 个一组翻转链表](https://leetcode-cn.com/problems/reverse-nodes-in-k-group)

给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

k 是一个正整数，它的值小于或等于链表的长度。

如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

进阶：

- 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
- 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

## 解题思路

首先把链表节点按照 k 个一组分组划分子链表，对子链表进行翻转，然后再重新连接在一起。在划分的时候，首先要判断剩余节点长度是否大于等于k，如果是，就划分并翻转，否则不需要翻转。

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

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || head?.next == nil || k == 1 {
        return head
    }
    var head = head
    // 添加哨兵节点
    let sentry: ListNode = ListNode(0)
    // 让哨兵节点指向头结点
    sentry.next = head
    // 保存指针，方便后面连接子链表
    var temp: ListNode? = sentry
    
    while head != nil {
        var tail: ListNode? = temp
        
        // 获得子链表头尾节点
        for _ in 0..<k {
            tail = tail?.next
            // 如果遇到尾结点为空，说明剩余节点不足k个，直接返回
            if tail == nil {
                return sentry.next
            }
        }
        
        let next = tail?.next
        // 翻转一个子链表，并且返回新的头与尾
        let res = reverseList(head, k)
        head = res.0
        tail = res.1
        // 把子链表重新接回原链表
        temp?.next = head
        tail?.next = next
        
        // 移动指针，准备下次循环
        temp = tail
        head = tail?.next
    }
    
    return sentry.next
}

func reverseList(_ head: ListNode?, _ k: Int) -> (ListNode?, ListNode?) {
    var prev: ListNode? = nil
    var curr: ListNode? = head
    var n = k
    
    while n != 0 {
        let nextTemp = curr?.next
        curr?.next = prev
        prev = curr
        curr = nextTemp
        n -= 1
    }
    return (prev, head)
}

func createLinkedList(_ list: Array<Int>) -> ListNode? {
    let senty = ListNode(0)
    var pre = senty
    for i in list {
        let node = ListNode(i)
        pre.next = node
        pre = node
    }
    return senty.next
}

var node = createLinkedList([1,2,3,4,5])
node = reverseKGroup(node, 2)
while node != nil {
    print(node!.val)
    node = node?.next
}
```

### Python

```python
# 翻转一个子链表，并且返回新的头与尾
def reverse(self, head: ListNode, tail: ListNode):
    prev = tail.next
    p = head
    while prev != tail:
        nex = p.next
        p.next = prev
        prev = p
        p = nex
    return tail, head

def reverseKGroup(self, head: ListNode, k: int) -> ListNode:
    hair = ListNode(0)
    hair.next = head
    pre = hair

    while head:
        tail = pre
        # 查看剩余部分长度是否大于等于 k
        for i in range(k):
            tail = tail.next
            if not tail:
                return hair.next
        nex = tail.next
        head, tail = self.reverse(head, tail)
        # 把子链表重新接回原链表
        pre.next = head
        tail.next = nex
        pre = tail
        head = tail.next
    
    return hair.next
```

## 复杂度分析

- 时间复杂度：O(n)，其中 n 为链表的长度
- 空间复杂度：O(1)