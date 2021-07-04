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