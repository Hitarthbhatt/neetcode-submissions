extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs === rhs
    }
}


class Solution {
    var map = [Node?: Node?]()
    
    func getNode(_ node: Node?) -> Node? {
        if node == nil { return nil }
        if map[node] == nil {
            map[node] = Node(node!.val)
        }
        
        return map[node]!
    }
    
    func copyRandomList(_ head: Node?) -> Node? {
        
        var cur: Node? = head
        while cur != nil {
            getNode(cur)?.val = cur!.val
            getNode(cur)?.next = getNode(cur?.next)
            getNode(cur)?.random = getNode(cur?.random)
            
            cur = cur?.next
        }
        
        return getNode(head)
    }
}