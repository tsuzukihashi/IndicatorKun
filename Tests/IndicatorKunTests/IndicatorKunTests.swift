import XCTest
@testable import IndicatorKun

@available(iOS 13.0, *)
@available(tvOS 13.0, *)
@available(watchOS 6.0, *)
@available(OSX 10.15, *)
final class IndicatorKunTests: XCTestCase {
    var view: IndicatorKun!
    
    override func setUp() {
        view = .init()
    }
    
    func testExample() {
        XCTAssertEqual(view.isAnimation, false)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
