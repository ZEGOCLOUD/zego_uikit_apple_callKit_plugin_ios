//
//  ZegoCallKitProvider+Plugin.swift
//  ZegoUIKitAppleCallKitPlugin
//
//  Created by zego on 2024/04/24.
//

import Foundation
import ZegoPluginAdapter


extension ZegoCallKitProvider: ZegoPluginProvider {
    public func getPlugin() -> ZegoPluginProtocol? {
        ZegoUIKitAppleCallKitPlugin.shared
    }
}