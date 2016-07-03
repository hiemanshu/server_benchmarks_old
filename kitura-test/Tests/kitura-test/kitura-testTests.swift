import XCTest
@testable import kitura-test

class kitura-testTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(kitura-test().text, "Hello, World!")
    }


    static var allTests : [(String, (kitura-testTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
