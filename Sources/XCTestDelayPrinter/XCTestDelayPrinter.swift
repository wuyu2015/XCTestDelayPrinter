import XCTest

public class XCTestDelayPrinter {
    public static let shared = XCTestDelayPrinter()
    
    // Usage: XCTestDelayPrinter.shared.p(content to print)
    private init() {
        XCTestObservationCenter.shared.addTestObserver(XCTestDelayPrinterObserver())
    }
    
    private var prBuf: [Any] = []
    private var fnBuf: [() -> Any] = []
    
    public func pr(_ items: Any...) {
        // Store the content for delayed printing
        prBuf.append(contentsOf: items)
    }
    
    public func delay(_ fn: @escaping () -> Any) {
        // Store the content for delayed functions
        fnBuf.append(fn)
    }
    
    public func clear() {
        prBuf.removeAll()
        fnBuf.removeAll()
    }
    
    public func printAll() {
        prBuf.forEach {
            print($0)
        }
    }
    
    public func runAll() {
        fnBuf.forEach {
            print($0())
        }
    }
}

final class XCTestDelayPrinterObserver: NSObject, XCTestObservation {
    private var isSelectedTests = false
    
    func testSuiteDidFinish(_ testSuite: XCTestSuite) {
        if !isSelectedTests {
            switch testSuite.name {
            case "Selected tests":
                // Mark when a specific test case is clicked
                isSelectedTests = true
            case "All tests":
                // When running all tests(⌘ + U): clear stored output
                XCTestDelayPrinter.shared.clear()
            default:
                break
            }
            
        }
    }
    
    func testBundleDidFinish(_ testBundle: Bundle) {
        if isSelectedTests {
            // Selected tests: print the stored output
            XCTestDelayPrinter.shared.printAll()
            XCTestDelayPrinter.shared.runAll()
        }
        // After running all tests, clear the stored output without printing
        XCTestDelayPrinter.shared.clear()
    }
}
