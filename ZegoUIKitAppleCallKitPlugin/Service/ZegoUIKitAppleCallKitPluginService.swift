//
//  ZegoUIKitAppleCallKitPluginService.swift
//  ZegoUIKitAppleCallKitPluginService
//
//  Created by zego on 2024/04/24.
//

import ZegoPluginAdapter
import ZegoUIKit

class ZegoUIKitAppleCallKitPluginService: NSObject {
    
    static let shared = ZegoUIKitAppleCallKitPluginService()
    
    private var notifyWhenAppRunningInBackgroundOrQuit: Bool = false
    private var isSandboxEnvironment: Bool = false
        
    let pluginEventHandlers: NSHashTable<ZegoCallKitPluginEventHandler> = NSHashTable(options: .weakMemory)
    
    override init() {
        super.init()
    }
    
    
    public func enableVoIP(_ isSandboxEnvironment: Bool){
        LogManager.sharedInstance().write("[CallKit][ZegoUIKitAppleCallKitPluginService][enableVoIP] isSandbox:\(isSandboxEnvironment)", flush: true)

        self.isSandboxEnvironment = isSandboxEnvironment
        // 注册 CallKit 回调
        CallKitManager.shared.delegate = self
        CallKitManager.shared.enableVoIP(isSandboxEnvironment)
    }
    
    // 注册 CallKit 的回调
    public func registerPluginEventHandler(_ delegate: ZegoCallKitPluginEventHandler) {
        pluginEventHandlers.add(delegate)
    }
    
    @available(*, deprecated, message: "Use reportIncomingCall(uuid, title, hasVideo, identifier) instead")
    public func reportIncomingCall(with uuid: UUID, title: String, hasVideo: Bool) {
        CallKitManager.shared.reportIncomingCall(with: uuid, title: title, hasVideo: hasVideo)
    }
    
    public func reportIncomingCall(with uuid: UUID, title: String, hasVideo: Bool, identifier: String) {
        CallKitManager.shared.reportIncomingCall(with: uuid, title: title, hasVideo: hasVideo, identifier: identifier)
    }
    
    public func reportCallEnded(with uuid: UUID, reason: Int) {
        CallKitManager.shared.reportCallEnded(with: uuid, reason: reason)
    }
    
    public func endCall(with uuid: UUID) {
        CallKitManager.shared.endCall(with: uuid)
    }
    
    public func endAllCalls() {
        CallKitManager.shared.endAllCalls()
    }
}
