import Foundation

var formatter = DateFormatter()
formatter.dateFormat = "h:mm:ss MMM d, yyyy" // "MM d, yyyy"
formatter.string(from: Date())
