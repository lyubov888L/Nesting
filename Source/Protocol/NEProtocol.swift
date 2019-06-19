//
//  Nesting
//
//  Copyright (c) 2019-Present Warpdrives Team - https://github.com/warpdrives
//
//  The software is available under the Apache 2.0 license. See the LICENSE file
//  for more info.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit

protocol NECreatNested: class {
    /// Creat a nested viewController
    ///
    /// - Parameter childConrtoller:    The childControllers in the nested viewController.
    /// - Parameter headerView:         Head view that does not participate in the linkage between the bottom lists.
    func ne_creatNestedViewController(_ childConrtoller: [UIViewController], _ headerView: UIView?)
    
    var ne_backgroundColor: UIColor { get set }
    
    var ne_header: UIView { get set }
}

extension NECreatNested where Self: UIViewController {
    func ne_creatNestedViewController(_ childConrtoller: [UIViewController], _ headerView: UIView?) {
        ne_creatNestedContainer(childConrtoller, headerView)
    }

    var ne_backgroundColor: UIColor {
        get {
            return ne_config.ne_backgroundColor
        }
        set {
            ne_config.ne_backgroundColor = newValue
        }
    }
    
    var ne_header: UIView {
        get {
            return ne_config.ne_header
        }
        set {
            ne_config.ne_header = newValue
        }
    }
}

protocol NELinkage: class {
    func ne_changeHeaderView(originY: CGFloat)
}
