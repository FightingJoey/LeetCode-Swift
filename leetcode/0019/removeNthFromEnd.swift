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

