//
//  String+extension.swift
//  LargeFileDownload
//
//  Created by sh-lx on 2019/3/21.
//  Copyright © 2019年 WangDan. All rights reserved.
//

import Foundation

extension String {
    
    func getFileSize() -> UInt64 {
        var size: UInt64 = 0
        let fileManager = FileManager.default
        var isDir: ObjCBool = ObjCBool.init(false)
        let isExists = fileManager.fileExists(atPath: self, isDirectory: &isDir)
        
        //判断文件是否存在
        guard isExists else {
            return size
        }
        
        if isDir.boolValue { //该目录下所有的文件名
            let enumerator = fileManager.enumerator(atPath: self)
            for subPath in enumerator! {
                //获得全路径
                let filePath = self + "/\(subPath)"
                do {
                    let attr = try fileManager.attributesOfItem(atPath: filePath)
                    size += attr[FileAttributeKey.size] as! UInt64
                } catch {
                    print("error:\(error)")
                }
            }
        } else { //这里证明是单文件
            
            do {
                let attr = try fileManager.attributesOfItem(atPath: self)
                size += attr[FileAttributeKey.size] as! UInt64
            } catch {
                print("error:\(error)")
            }
        }
        return size
        
    }
}
