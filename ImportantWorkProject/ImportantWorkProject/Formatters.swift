//
//  Formatters.swift
//  ImportantWorkProject
//
//  Created by Steven Thompson on 2017-02-14.
//  Copyright © 2017 stevethomp. All rights reserved.
//

import Foundation

extension Formatter {
    enum Number {
        static func countInThousands(from number: Int) -> String {
            let form = NumberFormatter()
            form.roundingIncrement = 1000
            form.numberStyle = .decimal

            if number >= 1000,
                let rounded = form.string(from: NSNumber(value: number)) {
                return rounded.replacingOccurrences(of: ",000", with: "k")

            } else {
                return String(number)
            }
        }
    }
}

extension Formatter {
    static func displayDate(fromDate date: Foundation.Date) -> String {
        let calendar = Calendar.current

        if calendar.isDateInToday(date) {
            let timeInt = date.timeIntervalSinceNow

            // "Just Now" - Less than a minute ago
            if timeInt > -60 {
                let format = NSLocalizedString("%d min(s) ago", comment: "")
                return NSString.localizedStringWithFormat(format as NSString, 0) as String

                // "13 mins ago" - within the last hour
            } else if timeInt > -3600 {
                let mins = abs(Int(timeInt / 60))
                let format = NSLocalizedString("%d min(s) ago", comment: "")
                return NSString.localizedStringWithFormat(format as NSString, mins) as String

                // "7 hrs ago" - within the last day, only on today
            } else {
                let hrs = abs(Int(timeInt / 60 / 60))
                let format = NSLocalizedString("%d hour(s) ago", comment: "")
                return NSString.localizedStringWithFormat(format as NSString, hrs) as String
            }

            // "Yesterday at 7:14 AM" - yesterday at time
        } else if calendar.isDateInYesterday(date) {
            return FormatterStorage.manager.yesterdayDisplayDateFormatter.string(from: date)

            // "Aug 25 at 5:45 PM" - Within this year
        } else if (calendar as NSCalendar).isDate(date, equalTo: Foundation.Date(), toUnitGranularity: .year) {
            return FormatterStorage.manager.displayDateFormatter.string(from: date)

            // "Aug 25, 2015 at 5:45 PM" - Any previous year
        } else {
            return FormatterStorage.manager.pastYearDisplayDateFormatter.string(from: date)
        }
    }
}

fileprivate struct FormatterStorage {
    static let manager = FormatterStorage()

    //MARK: Date
    let messageServerDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "UTC")
        df.timeZone = TimeZone(abbreviation: "UTC")
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df
    }()

    let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d" + "' at '" + "h:mm a"
        return formatter
    }()
    let shortDisplayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter
    }()
    let yesterdayDisplayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "'Yesterday at '" + "h:mm a"
        return formatter
    }()
    let pastYearDisplayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d" + "', '" + "yyyy" + "' at '" + "h:mm a"
        return formatter
    }()
    let shortPastYearDisplayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d" + "', '" + "yyyy"
        return formatter
    }()
}
