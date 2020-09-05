import XCTest
@testable import M7Native

final class M7NativeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(M7Native().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
