import Foundation
import UIKit

extension UIColor {
    static var myControlBackground: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
            UIColor(red: 0.5, green: 0.4, blue: 0.3, alpha: 0.1) :
            UIColor(red: 0.3, green: 0.4, blue: 0.5, alpha: 1)
        }
    }
}
