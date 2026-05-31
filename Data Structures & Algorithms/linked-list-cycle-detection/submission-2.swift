/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil && head?.next != nil else { return false }
        var slow = head
        var fast = head
        
        while fast != nil {
            fast = fast?.next
            if (fast != nil) {
                fast = fast?.next
            }
            
            slow = slow?.next
            
            if slow === fast {
                return true
            }
        }
        return false
    }
}
