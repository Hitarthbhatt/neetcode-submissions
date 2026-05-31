class Solution {
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