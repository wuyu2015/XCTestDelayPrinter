import XCTest

public class XCTestDelayPrinter {
    public static let shared = XCTestDelayPrinter()
    
    // Usage: XCTestDelayPrinter.shared.p(content to print)
    private init() {
        XCTestObservationCenter.shared.addTestObserver(XCTestDelayPrinterObserver())
    }
    
    // MARK: pr
    
    // [items, separator, terminator]
    private var prBuf: [([Any], String, String)] = []
    
    public func pr(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        // Store the content for delayed printing
        prBuf.append((items, separator, terminator))
    }
    
    public func pr(items: [Any], separator: String = " ", terminator: String = "\n") {
        guard !items.isEmpty else {
            return
        }
        // Store the content for delayed printing
        prBuf.append((items, separator, terminator))
    }
    
    // MARK: delay
    
    private var fnBuf: [() -> Any] = []
    
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
            let (arr, separator, terminator) = $0
            for i in 0..<arr.count - 1 {
                print(arr[i], terminator: separator)
            }
            if arr.count > 1 {
                print(arr.last!, terminator: "")
            }
            print(terminator: terminator)
        }
    }
    
    public func runAll() {
        fnBuf.forEach {
            print($0())
        }
    }
}

// MARK: Observer

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
