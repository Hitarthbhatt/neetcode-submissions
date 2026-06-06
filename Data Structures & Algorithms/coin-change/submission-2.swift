class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        // -2 = uncomputed, -1 = impossible, >= 0 = answer
        var memo = Array(repeating: -2, count: amount + 1)
        memo[0] = 0

        func dfs(_ rem: Int) -> Int {
            if rem < 0 { return -1 }
            if memo[rem] != -2 { return memo[rem] }

            var best = Int.max
            for c in coins {
                let sub = dfs(rem - c)
                if sub >= 0 {
                    best = min(best, sub + 1)
                }
            }
            memo[rem] = (best == Int.max) ? -1 : best
            return memo[rem]
        }

        return dfs(amount)   // already returns -1 when impossible
    }
}