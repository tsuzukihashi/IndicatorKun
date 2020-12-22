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
    
    func test_isAnimation() {
        XCTAssertEqual(view.isAnimation, false)
    }
    
    func test_title() {
        XCTAssertEqual(view.title, "読み込み中")
        
        view = .init(title: "少々お待ちください")
        
        XCTAssertEqual(view.title, "少々お待ちください")
    }

    static var allTests = [
        ("test_isAnimation", test_isAnimation),
        ("test_title", test_title)
    ]
}
