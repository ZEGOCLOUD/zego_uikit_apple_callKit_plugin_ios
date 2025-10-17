//
//  ZegoUIKitAppleCallKitPlugin.swift
//  ZegoUIKitAppleCallKitPlugin
//
//  Created by zego on 2024/04/24.
//

import ZegoPluginAdapter


public class ZegoUIKitAppleCallKitPlugin: ZegoCallKitPluginProtocol {
    
    
    public static let shared = ZegoUIKitAppleCallKitPlugin()
    
    public init() {
        
    }
    
    
    let service = ZegoUIKitAppleCallKitPluginService.shared
    
    public var pluginType: ZegoPluginType {
        .callkit
    }
        
    public var version: String {
        "1.0.0"
    }
    
    
    // MARK: CallKit
    // 开启 voip, 并传入环境
    public func enableVoIP(isSandboxEnvironment: Bool) {
        service.enableVoIP(isSandboxEnvironment: isSandboxEnvironment)
    }
    
    // 注册 CallKit 的回调
    public func registerPluginEventHandler(_ delegate: ZegoCallKitPluginEventHandler) {
        service.registerPluginEventHandler(delegate)
    }
    
    public func reportIncomingCall(with uuid: UUID, title: String, hasVideo: Bool, identifier: String) {
        service.reportIncomingCall(with: uuid, title: title, hasVideo: hasVideo, identifier: identifier)
    }

    public func reportCallEnded(with uuid: UUID, reason: Int) {
        service.reportCallEnded(with: uuid, reason: reason)
    }
    
    public func endCall(with uuid: UUID) {
        service.endCall(with: uuid)
    }
    
    public func endAllCalls() {
        service.endAllCalls()
    }
}
