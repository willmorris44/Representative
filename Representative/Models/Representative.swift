//
//  Representative.swift
//  Representative
//
//  Created by Will morris on 5/16/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import Foundation

struct TopLevelDict: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    
    let name: String
    let party: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
