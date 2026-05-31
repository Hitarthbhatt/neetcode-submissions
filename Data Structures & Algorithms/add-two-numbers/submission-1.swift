class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        
        var head: ListNode? = ListNode(-1)
        var curr = head
        var carry = 0
        while carry != 0 || l1 != nil || l2 != nil {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            let val = sum%10
            carry = sum/10
            
            curr?.next = ListNode(val)
            curr = curr?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return head?.next
    }
    
}