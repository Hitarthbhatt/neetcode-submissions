class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var left: ListNode? = .init(-1)
        left?.next = head
        var start: ListNode? = left
        var right = head
        
        for _ in 0..<n {
            right = right?.next
        }
        
        while right != nil {
            left = left?.next
            right = right?.next
        }
        
        left?.next = left?.next?.next
        
        return start?.next
    }
}