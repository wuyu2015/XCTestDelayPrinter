import XCTest
@testable import XCTestDelayPrinter

final class PrTests: XCTestCase {
    func testPr1() {
        pr("Hello world!")
    }
    
    func testPr2() {
        pr("Hello world!", "a", "b", "c", separator: ",", terminator: " >> ")
        pr("⚽️", "🏀", "🎾", "⚾️", separator: "👌")
        // output: Hello world!,a,b,c >> ⚽️👌🏀👌🎾👌⚾️
    }
}
