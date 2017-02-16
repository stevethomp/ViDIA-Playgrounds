import UIKit
import PlaygroundSupport
@testable import ImportantWorkProjectPlayground

// Set up view
let custom = CustomSegmentControl()
custom.backgroundColor = .red
custom.frame = CGRect(x: 0, y: 0, width: 300, height: 40)

// Customize
custom.segments = ["One", "Two", "Three"]
custom.selectIndex(1)

// Add to playground view
PlaygroundPage.current.liveView = custom
