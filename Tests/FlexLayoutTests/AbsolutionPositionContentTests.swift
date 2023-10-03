// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import FlexLayout
import XCTest

final class AbsolutionPositionContentTests: XCTestCase {

    var viewController: UIViewController!
    var rootFlexContainer: UIView!
    var aView: UIView!

    override func setUp() {
        super.setUp()

        viewController = UIViewController()

        rootFlexContainer = UIView()
        rootFlexContainer.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        viewController.view.addSubview(rootFlexContainer)

        aView = UIView()
    }

    func test_absolute_position_1() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).position(.absolute).left(10).right(10).width(300).height(200)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 10.0, y: 0.0, width: 300.0, height: 200.0))
    }

    func test_absolute_position_2() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).position(.absolute).left(10).right(10).width(300).height(200)
        }

        // Later reset the aspectRatio
        aView.flex.left(0)
        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
    }

    func test_absolute_position_3() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).position(.absolute).horizontally(15).vertically(20)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 15.0, y: 20.0, width: 370.0, height: 360.0))
    }

    func test_absolute_position_4() {
        rootFlexContainer.flex.define { flex in
            flex.addItem(aView).position(.absolute).all(45)
        }

        rootFlexContainer.flex.layout()
        XCTAssertEqual(aView.frame, CGRect(x: 45.0, y: 45.0, width: 310.0, height: 310.0))
    }
}
