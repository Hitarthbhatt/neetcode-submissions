class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return  nil }
        
        let left = root?.left
        let right = root?.right
        
        root?.left = right
        root?.right = left
        
        invertTree(root?.left)
        invertTree(root?.right)
        
        return root
    }
}
