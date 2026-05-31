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
    var imap: [Int: Int] = [:]
    var index: Int = 0
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (idx, val) in inorder.enumerated() {
            imap[val] = idx
        }

        return dfs(preorder, 0, inorder.count - 1)
    }

    func dfs(_ preorder: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }

        let val = preorder[index]
        index += 1
        let mid = imap[val]!
        let root = TreeNode(val)

        root.left = dfs(preorder, left, mid - 1)
        root.right = dfs(preorder, mid + 1, right)

        return root
    }
}
