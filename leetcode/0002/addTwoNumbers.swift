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
    
    if carry == 1 {
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
