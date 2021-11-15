//
//  VideoModel.swift
//  Africa
//
//  Created by Patrick Spafford on 11/8/21.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
