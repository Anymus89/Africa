//
//  VideoModel.swift
//  Africa
//
//  Created by Manuel Martinez on 05/07/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
