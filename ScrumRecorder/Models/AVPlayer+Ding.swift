//
//  AVPlayer+Ding.swift
//  ScrumRecorder
//
//  Created by Chad Smith on 2/27/22.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: ".wav") else {
            fatalError("Failed to load sound file")
        }
        
        return AVPlayer(url: url)
    }()
}
