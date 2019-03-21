//
//  NSObject+extension.swift
//  LargeFileDownload
//
//  Created by sh-lx on 2019/3/21.
//  Copyright © 2019年 WangDan. All rights reserved.
//

import Foundation

extension NSObject {
    
    func getCurrentFilesSize(_ filePath: String) -> (Float) {
        
        let manager = FileManager.default
        var fileSize: Float = 0.0
        
        if manager.fileExists(atPath: filePath) {
            if let attr: [FileAttributeKey : Any] = try? manager.attributesOfItem(atPath: filePath) {
                fileSize = attr[FileAttributeKey.size] as! Float
            }
        }
        return fileSize
    }
    
}
