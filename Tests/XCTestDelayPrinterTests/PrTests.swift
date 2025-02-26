import XCTest
@testable import XCTestDelayPrinter

final class PrTests: XCTestCase {
    func testPr1() {
        pr("Hello world!")
    }
    
    func test2() {
        pr("Hello world!", "a", "b", "c", separator: ",", terminator: " >> ")
        pr("⚽️", "🏀", "🎾", "⚾️", separator: "👌")
        // Hello world!,a,b,c >> ⚽️👌🏀👌🎾👌⚾️
    }
    
    func test3() {
        pr("Force output:", terminator: " ", force: true)
        pr("Hello world!", "a", "b", "c", separator: ",", terminator: " >> ", force: true)
        pr("⚽️", "🏀", "🎾", "⚾️", separator: "👌", force: true)
        // Force output: Hello world!,a,b,c >> ⚽️👌🏀👌🎾👌⚾️
    }
}
