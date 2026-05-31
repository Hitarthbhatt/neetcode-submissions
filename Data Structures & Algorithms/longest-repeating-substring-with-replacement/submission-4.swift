class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var res = 0
        let charSet = Set(s)
        let chars = Array(s)

        for c in charSet {
            var count = 0, l = 0

            for r in 0..<chars.count {
                if chars[r] == c {
                    count += 1
                }

                while (r - l + 1) - count > k {
                    if chars[l] == c {
                        count -= 1
                    }
                    l += 1
                }

                res = max(res, r - l + 1)
            }
        }
        return res
    }
}