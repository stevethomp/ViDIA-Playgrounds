import UIKit
import PlaygroundSupport

public var playgroundSize: CGSize = CGSize(width: 320, height: 568)

public var playgroundView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: playgroundSize.width, height: playgroundSize.height))
    view.backgroundColor = .white
    view.layer.borderColor = UIColor.darkGray.cgColor
    view.layer.borderWidth = 1.0 / UIScreen.main.scale

    PlaygroundPage.current.liveView = view

    return view
}()

public var playgroundNeedsIndefiniteExecution: Bool = false {
didSet {
    PlaygroundPage.current.needsIndefiniteExecution = playgroundNeedsIndefiniteExecution
}
}

fileprivate let frameworkBundleName = "com.stevethomp.ImportantWorkProjectPlayground.framework"

public extension Bundle {
    public static var frameworkBundle: Bundle {
        return Bundle(identifier: frameworkBundleName)!
    }
}
