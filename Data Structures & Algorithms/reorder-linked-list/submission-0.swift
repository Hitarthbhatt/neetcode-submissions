class Solution {
    func reorderList(_ head: ListNode?) {
        guard head != nil && head!.next != nil else { return }
        var slow = head
        var fast = head?.next?.next
            
        while (fast != nil) {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        var curr = slow?.next
        slow?.next = nil
        var prev: ListNode? = nil
        
        while (curr != nil) {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        curr = head
        
        while (curr != nil) {
            let nextL = curr?.next
            let nextR = prev?.next
            
            curr?.next = prev
            prev?.next = nextL
            
            curr = nextL
            prev = nextR
        }
        
        curr?.next = prev
    }
}