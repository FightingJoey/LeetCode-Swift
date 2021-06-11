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
    if carry == 1:
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

