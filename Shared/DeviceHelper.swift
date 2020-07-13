//
//  DeviceHelper.swift
//  iOS
//
//  Created by Ryan Priebe on 2020-07-02.
//

import SwiftUI
import Foundation

class DeviceHelper {
    private static let device: UIDevice = UIDevice.current
    
    public static func isiPad() -> Bool {
        return device.model == "iPad"
    }
    
    public static func isiPhone() -> Bool {
        return device.model == "iPhone"
    }
    
    public static func isLandscape() -> Bool {
        return device.orientation.isLandscape
    }
}
