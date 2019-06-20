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

public extension UIViewController {
    /// Get UINavigationBar's height.
    var ne_navigationBarHeight: CGFloat {
        get {
            guard let frame: CGRect = self.navigationController?.navigationBar.value(forKey: "frame") as? CGRect else {
                return 0.0
            }
            let y = frame.origin.y
            let height = frame.size.height
            return y + height
        }
    }
    
    /// An NSMapTable responsible for storing property.
    private static var _mapTable = NSMapTable<NSString, AnyObject>(keyOptions: .strongMemory, valueOptions: .weakMemory)

    /// Monitor the scroll events of the UITableView.
    var ne_monitor: NEMonitor {
        get {
            let monitor: NEMonitor = UIViewController._mapTable.object(forKey: ne_map(key: "NEMonitor")) as? NEMonitor ?? NEMonitor()
            monitor.registerScrollMonitor()
            monitor.setDelegate(targrt: self)
            return monitor
        }
        set(newValue) {
            UIViewController._mapTable.setObject(newValue, forKey: ne_map(key: "NEMonitor"))
        }
    }
    
    /// HeaderView of a nested view controller.
    var ne_header: UIView {
        get {
            let view = UIViewController._mapTable.object(forKey: "Header") as? UIView ?? UIView()
            return view
        }
        set(newValue) {
            UIViewController._mapTable.setObject(newValue, forKey: "Header")
        }
    }
    
    /// The bottommost UIScrollView container of the nested view controller.
    var ne_scrollView: UIScrollView {
        get {
            guard let scrollView = UIViewController._mapTable.object(forKey: "ScrollView") as? UIScrollView else {
                let spareScrollView = UIScrollView()
                spareScrollView.backgroundColor = .clear
                spareScrollView.isPagingEnabled = true
                spareScrollView.showsHorizontalScrollIndicator = false
                spareScrollView.showsVerticalScrollIndicator = false
                spareScrollView.scrollsToTop = false
                UIViewController._mapTable.setObject(spareScrollView, forKey: "ScrollView")
                return spareScrollView
            }
            return scrollView
        }
        set(newValue) {
            UIViewController._mapTable.setObject(newValue, forKey: "ScrollView")
        }
    }
    
    /// Generate a key of type NSString.
    private func ne_map(key: String) -> NSString {
        return NSString(string: "\(key)\(ne_address(instance: self))")
    }
}
