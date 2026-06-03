extension Node: Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs === rhs
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
}

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil { return nil }
        var clone: Node = Node(node!.val)
        var q: [Node] = [node!]
        var map: [Node: Node] = [:]
        map[node!] = clone
        
        while !q.isEmpty {
            let item = q.removeFirst()
            
            for nbr in item.neighbors {
                if let nbr {
                    if map[nbr] == nil {
                        map[nbr] = Node(nbr.val)
                        q.append(nbr)
                    }
                    
                    map[item]?.neighbors.append(map[nbr])
                }
            }
        }
        
        return clone
    }
}

