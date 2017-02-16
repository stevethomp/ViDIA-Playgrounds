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

// Get actions
class Receiver {
    @objc func didSelectValue(sender: CustomSegmentControl) {
        print("Tapped segment \(sender.selectedSegmentIndex)")
    }
}
let receiver = Receiver()
custom.addTarget(receiver, action: #selector(Receiver.didSelectValue(sender:)), for: .valueChanged)

playgroundView.addSubview(custom)

custom.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    custom.topAnchor.constraint(equalTo: playgroundView.topAnchor),
    custom.leftAnchor.constraint(equalTo: playgroundView.leftAnchor),
    custom.rightAnchor.constraint(equalTo: playgroundView.rightAnchor),
    custom.heightAnchor.constraint(equalToConstant: 40)
    ])

