import XCTest

extension XCTestCase {
    // Use pr(_) in the XCTestCase subclass
    public func pr(_ items: Any..., separator: String = " ", terminator: String = "\n", force: Bool = false) {
        if force {
            items.forEach {
                print($0, separator: separator, terminator: terminator)
            }
        } else {
            XCTestDelayPrinter.shared.pr(items: items, separator: separator, terminator: terminator)
        }
    }
    
    // Use delay(_) in the XCTestCase subclass
    public func delay(_ fn: @escaping () -> Any) {
        XCTestDelayPrinter.shared.delay(fn)
    }
}
