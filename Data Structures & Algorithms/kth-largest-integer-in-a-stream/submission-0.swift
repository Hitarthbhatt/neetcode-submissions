class Heap<Element: Comparable> {
    private var items: [Element] = []
    var count: Int { items.count }
    var min: Element? { items.last }

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

    @discardableResult func popMin() -> Element? {
        return items.popLast()
    }
}

class KthLargest {
    private let k: Int
    private var heap = Heap<Int>()

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            add(num)
        }
    }

    func add(_ val: Int) -> Int {
        if heap.min == nil || val < heap.min! {
            heap.insert(val)
        } else {
            heap.insert(val)
        }
        if heap.count > k {
            heap.popMin()
        }
        return heap.min ?? val
    }
}
