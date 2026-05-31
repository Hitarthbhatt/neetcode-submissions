
class Solution {
    var result: [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        dfs(n, 0, 0, "")
        return result
    }
    
    func dfs(_ n: Int, _ open: Int, _ close: Int, _ string: String) {
        if open > n || close > n || close > open { return }
        if open == close && open + close == 2 * n {
            result.append(string)
        }
        
        dfs(n, open + 1, close, string + "(")
        
        dfs(n, open, close + 1, string + ")")
    }
}