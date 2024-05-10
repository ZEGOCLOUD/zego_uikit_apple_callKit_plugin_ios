//
//  CallKitManagerDelegate.swift
//  ZegoUIKitSignalingPlugin
//
//  Created by Kael Ding on 2024/1/15.
//

import Foundation
import ZegoPluginAdapter

protocol CallKitManagerDelegate: NSObject {
    func didReceiveIncomingPush(_ uuid: UUID, invitationID: String,  data: String)
    
    func onCallKitStartCall(_ action: CallKitAction)
    
    func onCallKitAnswerCall(_ action: CallKitAction)
    
    func onCallKitEndCall(_ action: CallKitAction)
    
    func onCallKitSetHeldCall(_ action: CallKitAction)
    
    func onCallKitSetMutedCall(_ action: CallKitAction)
    
    func onCallKitSetGroupCall(_ action: CallKitAction)
    
    func onCallKitPlayDTMFCall(_ action: CallKitAction)
    
    func onCallKitTimeOutPerforming(_ action: CallKitAction)
}
