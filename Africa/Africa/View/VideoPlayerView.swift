//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Patrick Spafford on 11/9/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: Properties
    let videoPlayerHelper = VideoPlayerHelper()
    var videoSelected: String
    var videoTitle: String
    
    // MARK: Body
    var body: some View {
        VStack {
            VideoPlayer(
                player:
                    videoPlayerHelper.generatePlayingVideo(
                        fileName: videoSelected,
                        fileFormat: "mp4"
                    )
            ) {
                // Text(videoTitle)
            }//: VideoPlayer
            .overlay(
                Image("logo")
                    .fit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,
                alignment: .topLeading
            )
        } //: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(
                videoSelected: "lion",
                videoTitle: "Lion"
            )
        }
    }
}
