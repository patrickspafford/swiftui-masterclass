//
//  VideoListView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/23/21.
//

import SwiftUI

struct VideoListView: View {
    // MARK: Properties
    @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(
                        destination:
                            VideoPlayerView(
                                videoSelected: item.id,
                                videoTitle: item.name
                            )
                    ) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                } //: ForEach
            } //: List
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Shuffle videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    } //: Button
                } //: ToolbarItem
            } //: Toolbar
        } //: Navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
