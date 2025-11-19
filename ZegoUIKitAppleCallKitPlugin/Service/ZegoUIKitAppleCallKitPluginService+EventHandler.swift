//
//  ZegoUIKitAppleCallKitPluginService+EventHandler.swift
//  ZegoUIKitAppleCallKitPluginService
//
//  Created by zego on 2024/04/24.
//

import Foundation
import ZegoPluginAdapter
import ZegoPrebuiltLog

extension ZegoUIKitAppleCallKitPluginService: CallKitManagerDelegate {
    func didReceiveIncomingPush(_ uuid: UUID, invitationID: String, data: String) {
        for handler in pluginEventHandlers.allObjects {
            handler.didReceiveIncomingPush(uuid, invitationID: invitationID, data: data)
        }
    }
    
    func onCallKitStartCall(_ action: CallKitAction) {
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitStartCall(action)
        }
    }
    
    func onCallKitAnswerCall(_ action: CallKitAction) {
        LogManager.sharedInstance().write("[CallKit][CallKitManager][ZegoUIKitAppleCallKitPluginService+EventHandler][onCallKitAnswerCall] handler count:\(pluginEventHandlers.allObjects.count)", flush: true)
        
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitAnswerCall(action)
        }
    }
    
    func onCallKitEndCall(_ action: CallKitAction) {
        LogManager.sharedInstance().write("[CallKit][CallKitManager][ZegoUIKitAppleCallKitPluginService+EventHandler][onCallKitEndCall] handler count:\(pluginEventHandlers.allObjects.count)", flush: true)

        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitEndCall(action)
        }
    }
    
    func onCallKitSetHeldCall(_ action: CallKitAction) {
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitSetHeldCall(action)
        }
    }
    
    func onCallKitSetMutedCall(_ action: CallKitAction) {
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitSetMutedCall(action)
        }
    }
    
    func onCallKitSetGroupCall(_ action: CallKitAction) {
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitSetGroupCall(action)
        }
    }
    
    func onCallKitPlayDTMFCall(_ action: CallKitAction) {
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitPlayDTMFCall(action)
        }
    }
    
    func onCallKitTimeOutPerforming(_ action: CallKitAction) {
        for handler in pluginEventHandlers.allObjects {
            handler.onCallKitTimeOutPerforming(action)
        }
    }
}
