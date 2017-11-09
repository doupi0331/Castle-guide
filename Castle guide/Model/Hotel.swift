//
//  Hotel.swift
//  Castle guide
//
//  Created by Yi-Yun Chen on 2017/11/9.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import Foundation

class Hotel {
    let name: String
    let fileName: String
    let webside: String
    let address: String
    
    init(name: String, fileName: String, webside: String, address: String) {
        self.name = name
        self.fileName = fileName
        self.webside = webside
        self.address = address
    }
}
