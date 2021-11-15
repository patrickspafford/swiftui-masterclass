//
//  VideoListItem.swift
//  Africa
//
//  Created by Patrick Spafford on 11/8/21.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: Properties
    let video: VideoModel
    
    // MARK: Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                
                Image(video.thumbnail)
                    .fit()
                    .frame(height: 80)
                .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .fit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VStack
            
        } //: HStack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [VideoModel] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .compact()
    }
}
