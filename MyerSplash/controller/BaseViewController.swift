import Foundation
import UIKit

extension UIViewController {
    var appStatusBarStyle : UIStatusBarStyle {
        get {
            if #available(iOS 13.0, *) {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    return UIStatusBarStyle.lightContent
                } else {
                    return UIStatusBarStyle.darkContent
                }
            } else {
                return UIStatusBarStyle.lightContent
            }
        }
    }
}

open class BaseViewController: UIViewController {
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return appStatusBarStyle
        }
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setNeedsStatusBarAppearanceUpdate()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                setNeedsStatusBarAppearanceUpdate()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}
