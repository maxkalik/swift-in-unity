//
//  SwiftCodeKitBridging.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 9/29/22.
//

import Foundation

@_cdecl("startSwiftCodeKitController")
public func startSwiftCodeKitController() {
    SwiftCodeKit.start()
}

@_cdecl("swiftCodeKitConfigureMinMax")
public func swiftCodeKitConfigureMinMax(min: Double, max: Double) {
    SwiftCodeKit.configure(min: min, max: max)
}

@_cdecl("swiftCodeKitConfigureValue")
public func swiftCodeKitConfigureValue(value: Double) {
    SwiftCodeKit.configure(value: value)
}

@_cdecl("swiftCodeKitGetValue")
public func swiftCodeKitGetValue() -> Double {
    SwiftCodeKit.getValue()
}

@_cdecl("swiftCodeKitGetVersion")
public func swiftCodeKitGetVersion() -> UnsafePointer<CChar>? {
    let string = strdup(SwiftCodeKit.getVersion())
    return UnsafePointer(string)
}

// Delegates

@_cdecl("setSwiftCodeKitDidStart")
public func setSwiftCodeKitDidStart(delegate: @convention(c) @escaping () -> Void) {
    SwiftCodeKit.swiftCodeKitDidStart = delegate
}

@_cdecl("setSwiftCodeKitDidFinish")
public func setSwiftCodeKitDidFinish(delegate: @convention(c) @escaping () -> Void) {
    SwiftCodeKit.swiftCodeKitDidFinish = delegate
}

@_cdecl("setSwiftCodeKitStepperValueDidChange")
public func setSwiftCodeKitStepperValueDidChange(delegate: @convention(c) @escaping (Double) -> Void) {
    SwiftCodeKit.swiftCodeKitStepperValueDidChange = delegate
}
