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

struct Item: Comparable {
    let dist: Int
    let x: Int
    let y: Int

    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.dist < rhs.dist
    }
}

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var minHeap = Heap<Item>()

        for point in points {
            let x = point[0], y = point[1]
            let dist = x * x + y * y
            minHeap.insert(Item(dist: dist, x: x, y: y))
        }

        var res = [[Int]]()
        for _ in 0..<k {
            if let item = minHeap.popMin() {
                res.append([item.x, item.y])
            }
        }

        return res
    }
}