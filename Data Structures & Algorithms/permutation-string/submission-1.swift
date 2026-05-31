class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var mainKey: [Int] = Array(repeating: 0, count: 26)
        var mainKeySet: Set<Array<Int>> = .init()
        var s2Arr = Array(s2)
        
        for char in s1 {
            mainKey[char.index] += 1
        }
        mainKeySet.insert(mainKey)
        
        var i = 0, j = 0
        let mainSize = s1.count
        let size = s2.count
        
        var tempKey: [Int] = Array(repeating: 0, count: 26)
        while j < size {
            tempKey[s2Arr[j].index] += 1
            let length = j - i + 1
            j += 1
            
            if length == mainSize && mainKeySet.contains(tempKey) {
                return true
            } else if length >= mainSize || mainKeySet.contains(tempKey) {
                tempKey[s2Arr[i].index] -= 1
                i += 1
            }
        }
        
        return false
    }
}

extension Character {
    var index: Int {
        return Int(self.asciiValue! - 97)
    }
}