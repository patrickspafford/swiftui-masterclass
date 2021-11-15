//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Patrick Spafford on 11/9/21.
//

import Foundation
import AVKit

struct VideoPlayerHelper {
    
    func generatePlayingVideo(fileName: String, fileFormat: String) -> AVPlayer {
        var videoPlayer: AVPlayer?
        if let _ = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
            videoPlayer = AVPlayer(
                url: Bundle.main.url(
                    forResource: fileName,
                    withExtension: fileFormat
                )!
            )
            videoPlayer?.play()
        }
        return videoPlayer!
    }
    
}
