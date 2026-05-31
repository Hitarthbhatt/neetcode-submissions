/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var isBalanced: Bool = true
    func isBalanced(_ root: TreeNode?) -> Bool {
        dfs(root)
        return isBalanced        
    }

    func dfs(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }

        let left = dfs(root?.left)
        let right = dfs(root?.right)

        if isBalanced {
            isBalanced = abs(left - right) <= 1
        }

        return max(left, right) + 1
    }
}