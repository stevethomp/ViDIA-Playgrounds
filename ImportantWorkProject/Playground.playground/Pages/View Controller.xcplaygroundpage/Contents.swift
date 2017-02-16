import UIKit
@testable import ImportantWorkProjectPlayground
import PlaygroundSupport

let homeVC = HomeViewController(nibName: nil, bundle: Bundle.frameworkBundle)

PlaygroundPage.current.liveView = homeVC.view
