import XCTest

extension XCTestCase {
    // Use pr(_) in the XCTestCase subclass
    func pr(_ items: Any..., force: Bool = false) {
        if force {
            items.forEach {
                print($0)
            }
        } else {
            items.forEach {
                XCTestDelayPrinter.shared.pr($0)
            }
        }
    }
}
