//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Manuel Martinez on 05/07/22.
//

import Foundation
import AVKit

var videoPLayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        
        videoPLayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPLayer?.play()
        
    }
    return videoPLayer!
}
