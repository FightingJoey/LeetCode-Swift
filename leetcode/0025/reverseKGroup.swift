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
