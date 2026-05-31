class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sArr = Array(s)
        var countT: [Character: Int] = [:]
        var window: [Character: Int] = [:]
        
        for char in t {
            countT[char, default: 0] += 1
        }
        
        var res = [-1, -1], resLen = Int.max
        var i = 0, have = 0, need = countT.count
        
        for j in 0..<s.count {
            let char = sArr[j]
            window[char, default: 0] += 1
            
            if let count = countT[char], window[char] == count {
                have += 1
            }
            
            while have == need {
                if (j - i + 1) < resLen {
                    resLen = j - i + 1
                    res = [i, j]
                }
                
                let leftChar = sArr[i]
                window[leftChar, default: 0] -= 1
                
                if let count = countT[leftChar], window[leftChar]! < count {
                    have -= 1
                }
                i += 1
            }
        }
        
        let (left, right) = (res[0], res[1])
        return resLen == Int.max ? "" : String(sArr[left...right])
    }
}