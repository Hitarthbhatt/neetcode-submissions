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
    var counter: Int = 0
    func goodNodes(_ root: TreeNode?) -> Int {
        goodNodes(root, Int.min)
        return counter
    }

    func goodNodes(_ root: TreeNode?, _ prev: Int) {
        if root == nil { return }
        // print(root!.val, prev)
        if root!.val >= prev { 
            counter += 1
        }

        goodNodes(root?.left, max(root!.val, prev))
        goodNodes(root?.right, max(root!.val, prev))
    }
}
