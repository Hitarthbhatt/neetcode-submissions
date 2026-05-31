class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [Array<Int>: [String]] = [:]
        var result: [[String]] = []

        for str in strs {
            var array: [Int] = Array(repeating: 0, count: 27)
            for char in str {
                array[Int(char.asciiValue!) - 97] += 1
            }
            
            map[array, default: []].append(str)
        }

        for (_, value) in map {
            result.append(value)
        }
        return result
    }
}