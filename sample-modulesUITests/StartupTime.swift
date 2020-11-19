//
//  StartupTime.swift
//  sample-modulesUITests
//
//  Created by IHsan HUsnul on 19/11/20.
//

import XCTest

@available(iOS 13.0, *)
class StartupTime: XCTestCase {
    func testStartupTimePerformance() {
        measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
            XCUIApplication(bundleIdentifier: "com.bukalapak.sample-modules").launch()
        }
    }
    
    open class var applicationLaunch: XCTOSSignpostMetric {
        return XCTOSSignpostMetric(subsystem: "com.apple.FrontBoard",
                                   category: "AppLaunch",
                                   name: "AppLaunch")
    }
}
