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

