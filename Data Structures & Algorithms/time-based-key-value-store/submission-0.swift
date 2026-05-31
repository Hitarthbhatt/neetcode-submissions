class TimeMap {
    var keyMap: [String: [(String, Int)]] = [:]
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        keyMap[key, default: []].append((value, timestamp))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = keyMap[key] else { return "" }
        var res = ""
        var left = 0, right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left)/2
            
            if values[mid].1 <= timestamp {
                res = values[mid].0
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return res
    }
}
