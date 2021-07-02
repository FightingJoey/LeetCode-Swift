# 19. [Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

## Question

Given the `head` of a linked list, remove the `nth` node from the end of the list and return its head.

**Example 1:**

![img](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)

```
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]
```

**Example 2:**

```
Input: head = [1], n = 1
Output: []
```

**Example 3:**

```
Input: head = [1,2], n = 1
Output: [1]
```

**Constraints:**

- The number of nodes in the list is `sz`.
- `1 <= sz <= 30`
- `0 <= Node.val <= 100`
- `1 <= n <= sz`

## [删除链表的倒数第 N 个结点](https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/)

给你一个链表，删除链表的倒数第 `n` 个结点，并且返回链表的头结点。

**进阶：**你能尝试使用一趟扫描实现吗？

## 解题思路

先获取到链表的长度L，然后从头节点开始对链表进行一次遍历，当遍历到第 L-n+1 个节点时，它就是我们需要删除的节点。

为了方便删除操作，我们可以在头结点之前添加一个哨兵节点，然后开始遍历，当遍历到第 L−n+1 个节点时，它的下一个节点就是我们需要删除的节点，这样我们只需要修改一次指针，就能完成删除操作。

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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    let dummy = ListNode(0, head)
    let length = getLength(head)
    var cur: ListNode? = dummy
    for _ in 1..<length-n+1 {
        cur = cur?.next
    }
    cur?.next = cur?.next?.next
    return dummy.next
}

func getLength(_ head: ListNode?) -> Int {
    var head = head
    var length = 0
    while head != nil {
        length += 1
        head = head?.next
    }
    return length
}
```

### Python

```python
def removeNthFromEnd(head: ListNode, n: int) -> ListNode:
    def getLength(head: ListNode) -> int:
        length = 0
        while head:
            length += 1
            head = head.next
        return length
    
    dummy = ListNode(0, head)
    length = getLength(head)
    cur = dummy
    for i in range(1, length - n + 1):
        cur = cur.next
    cur.next = cur.next.next
    return dummy.next
```

## 复杂度分析

- 时间复杂度：*O*(L)，其中 L 是链表的长度。
- 空间复杂度：O(1)

