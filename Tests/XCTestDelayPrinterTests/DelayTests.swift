import XCTest
@testable import XCTestDelayPrinter

final class DelayTests: XCTestCase {
    func testDelayString() {
        delay {
            "hello world!"
        }
    }
    
    func testDelayInt() {
        delay {
            123
        }
    }
    
    func testDelayArray() {
        delay {
            [1, 2, 3]
        }
    }
    
    func testDelaySleep() {
        delay {
            print("Sleep start")
            // 1
            sleep(1)
            print(1)
            // 2
            sleep(1)
            print(2)
            // 3
            sleep(1)
            print(3)
            return "Sleep end"
        }
    }
}
