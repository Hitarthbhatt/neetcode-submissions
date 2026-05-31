class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let start = ListNode(-1)
        start.next = head
        var left: ListNode? = start
        var right = head
        while (right != nil) {
            for _ in 1..<k {
                right = right?.next
            }
            
            if (right != nil) {
                let next = right?.next
                let tail = reorderList(left, next)
                left = tail
                tail?.next = next
                right = next
            }
        }
        
        printVal(start.next)
        return start.next
    }
    
    func reorderList(_ head: ListNode?, _ end: ListNode?) -> ListNode? {
        guard head != nil && head!.next != nil else { return nil }
        var curr = head?.next
        let start = curr
        var prev: ListNode? = nil
        
        while (curr !== end) {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        head?.next = prev
        
        return start
    }
    
    func printVal(_ head: ListNode?) {
        var curr = head
        while curr != nil {
            print(curr!.val, terminator: " ")
            curr = curr?.next
        }
    }
}