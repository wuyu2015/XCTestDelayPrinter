import XCTest

extension XCTestCase {
    // Use pr(_) in the XCTestCase subclass
    public func pr(_ items: Any..., separator: String = " ", terminator: String = "\n", force: Bool = false) {
        if force {
            if items.count == 1 {
                print(items[0], terminator: terminator)
                return
            }
            for i in 0..<items.count - 1 {
                print(items[i], terminator: separator)
            }
            print(items.last!, terminator: terminator)
        } else {
            XCTestDelayPrinter.shared.pr(items: items, separator: separator, terminator: terminator)
        }
    }
    
    // Use delay(_) in the XCTestCase subclass
    public func delay(_ fn: @escaping () -> Any) {
        XCTestDelayPrinter.shared.delay(fn)
    }
}
