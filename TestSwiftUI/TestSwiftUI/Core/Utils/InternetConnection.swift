//
//  InternetConnection.swift
//  TestSwiftUI
//
//  Created by Nicolas Russi on 8/05/24.
//

import Foundation
import SystemConfiguration

public class InternetConnection {
    
    // MARK: - Public properties -
    
    static var isConnected: Bool {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sa_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else { return false }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return isReachable && !needsConnection
    }
    
    // MARK: - Lifecycle -
    
    private init() {}
}
