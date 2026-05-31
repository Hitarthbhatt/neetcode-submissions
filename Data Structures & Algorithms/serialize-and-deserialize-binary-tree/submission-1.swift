class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        let result = levelOrder(root)
        return result
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        let vals = data.split(separator: ",").map { String($0) }
        return createOrder(vals)
    }
    
    private func levelOrder(_ root: TreeNode?) -> String {
        if root == nil { return "" }
        var queue: [TreeNode?] = []
        queue.append(root)
        var result: [String] = []
        
        while (!queue.isEmpty) {
            let node = queue.removeFirst()
            if let val = node?.val {
                result.append("\(val)")
                queue.append(node?.left)
                queue.append(node?.right)
            } else {
                result.append("#")
            }
        }
        
        return result.joined(separator: ",")
    }
    
    private func createOrder(_ vals: [String]) -> TreeNode? {
        if vals.isEmpty { return nil }
        let root = TreeNode(Int(vals[0])!)
        var queue: [TreeNode] = [root]
        var index = 1
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if vals[index] != "#" {
                node.left = TreeNode(Int(vals[index])!)
                queue.append(node.left!)
            }
            index += 1
            
            if vals[index] != "#" {
                node.right = TreeNode(Int(vals[index])!)
                queue.append(node.right!)
            }
            index += 1
        }
        
        return root
    }
}
