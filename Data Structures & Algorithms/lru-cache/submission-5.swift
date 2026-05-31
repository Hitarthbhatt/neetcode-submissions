class Node {
    var key: Int
    var val: Int
    var next: Node?
    var prev: Node?
    
    init(key: Int, val: Int, next: Node? = nil, prev: Node? = nil) {
        self.key = key
        self.val = val
        self.next = next
        self.prev = prev
    }
}
 
class LRUCache {
    private let capacity: Int
    private var currentSize: Int { map.count }
    private var map: [Int: Node?] = [:]
    private var head: Node? = nil
    private var tail: Node? = nil
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else { return -1 }
        moveToHead(node)
        return node!.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node?.val = value
            moveToHead(node)
            return
        }
        
        insertNode(Node(key: key, val: value))
        map[key] = head
        evict()
    }
    
    private func moveToHead(_ node: Node?) {
        guard head !== node else { return}
        unlink(node)
        insertNode(node)
    }
    
    private func insertNode(_ node: Node?) {
        node?.next = head
        head?.prev = node
        head = node
        
        if tail == nil { tail = node }
    }
    
    private func evict() {
        guard currentSize > capacity else { return }
        map.removeValue(forKey: tail!.key)
        unlink(tail)
    }
    
    private func unlink(_ node: Node?) {
        node?.prev?.next = node?.next
        node?.next?.prev = node?.prev
        
        if head === node { head = node?.next }
        if tail === node { tail = node?.prev }
        
        node?.next = nil
        node?.prev = nil
    }
}