/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isBalanced(root, [Int.min, Int.max])
    }

    func isBalanced(_ root: TreeNode?, _ range: [Int]) -> Bool {
        if root == nil { return true }

        guard root!.val > range[0] && root!.val < range[1]
        else { return false }

        let left = isBalanced(root?.left, [range[0],root!.val])
        let right = isBalanced(root?.right, [root!.val,range[1]])

        return left && right
    }
}
