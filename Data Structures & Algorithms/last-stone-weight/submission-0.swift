class Heap<Element: Comparable> {
    private var items: [Element] = []
    var count: Int { items.count }
    var max: Element? { items.first }
    var min: Element? { items.last }
    var last: Element? { items.last }

    func insert(_ element: Element) {
        var low = 0
        var high = items.count
        
        while low < high {
            let mid = low + (high - low) / 2
            if items[mid] > element {
                low = mid + 1
            } else {
                high = mid
            }
        }
        items.insert(element, at: low)
    }
    
    func printItems() {
        print(items)
    }

    @discardableResult func popMin() -> Element? {
        return items.popLast()
    }
    
    @discardableResult func popMax() -> Element? {
        guard count > 0 else { return nil }
        return items.removeFirst()
    }
}


class Solution {
    var heap: Heap<Int> = .init()
    
    func lastStoneWeight(_ stones: [Int]) -> Int {
        for stone in stones {
            heap.insert(stone)
        }
        
        while heap.count > 1 {
            let first = heap.popMax()
            let second = heap.popMax()
            if second == nil {
                heap.insert(first!)
                continue
            }
            
            if first! > second! {
                heap.insert(first!-second!)
            }
        }
        
        return heap.last ?? 0
    }
}
