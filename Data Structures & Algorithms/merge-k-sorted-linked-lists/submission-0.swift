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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let n = lists.count
        guard n > 0 else { return nil }
        guard n > 1 else { return lists[0] }
        
        var sorted: ListNode? = lists[0]

        for idx in 1..<n {
            let l2 = lists[idx]
            sorted = mergeTwoLists(sorted, l2)
        }

        return sorted
    }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        var head: ListNode? = .init(-1)
        var curr: ListNode? = head
        
        while list1 != nil && list2 != nil {
            if list1!.val <= list2!.val {
                let next = list1?.next
                curr?.next = list1
                curr = curr?.next
                
                list1?.next = nil
                list1 = next
            } else {
                let next = list2?.next
                curr?.next = list2
                curr = curr?.next
                
                list2?.next = nil
                list2 = next
            }
        }
        
        while list1 != nil {
            let next = list1?.next
            curr?.next = list1
            curr = curr?.next
            
            list1?.next = nil
            list1 = next
        }
        
        while list2 != nil {
            let next = list2?.next
            curr?.next = list2
            curr = curr?.next
            
            list2?.next = nil
            list2 = next
        }
                
        
        return head?.next
    }
}
