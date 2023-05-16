//
//  SwiftCodeKit.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 9/29/22.
//

import UIKit

public class SwiftCodeKit {
    
    private static let viewController = SwiftCodeKitViewController()
    
    public static func start() {
        DispatchQueue.main.async {
            if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
                rootViewController.present(viewController, animated: true)
            }
        }
    }
    
    public static func configure(min: Double, max: Double) {
        viewController.configureStepper(min: min, max: max)
    }
    
    public static func configure(value: Double) {
        viewController.configureStepper(value: value)
    }
    
    public static func getValue() -> Double {
        viewController.stepperValue
    }
    
    public static func getVersion() -> String {
        return "Swift Code Kit 0.0.1"
    }
    
    public static func getUser() -> String {
        let user = Dummy.user1
        return user.dictionary?.stringify() ?? ""
    }
}

// MARK: - Delegates

public extension SwiftCodeKit {
    static var swiftCodeKitDidStart: (() -> Void)?
    static var swiftCodeKitDidFinish: (() -> Void)?
    static var swiftCodeKitStepperValueDidChange: ((Double) -> Void)?
    
    // User
    
    static var swiftCodeKitUserDidUpdate: ((String) -> Void)?
    static var swiftCodeKitUserPointerDidUpdate: ((UnsafePointer<CChar>?) -> Void)?
}
