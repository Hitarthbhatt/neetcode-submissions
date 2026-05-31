class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode? = nil
        
        while (curr != nil) {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        return prev
    }
}

