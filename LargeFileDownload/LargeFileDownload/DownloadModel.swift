//
//  DownloadModel.swift
//  LargeFileDownload
//
//  Created by sh-lx on 2019/3/21.
//  Copyright © 2019年 WangDan. All rights reserved.
//

import UIKit

typealias Success   = () -> ()
typealias Fail      = () -> ()
typealias progress  = () -> ()

class DownloadModel: NSObject {

    var success:Success?
    var fail: Fail?
    var progress: Progress?
    var urlString: String?
    var downloadPath: String?
    
    static let singleObject = DownloadModel()

    //创建session
    lazy var session:URLSession = {
        //只执行一次
        let config = URLSessionConfiguration.background(withIdentifier: "background_session")
        let currentSession = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.init())
        
        return currentSession
    }()
    
    class func shareModel() -> (DownloadModel) {
        return singleObject
    }
    
    func downloadFile(_ urlString: String,
                      _ downloadPath: String?,
                      _ success:@escaping Success,
                      _ progress: Progress?,
                      _ fail: Fail?) {
        self.success = success
        self.fail    = fail
        self.progress = progress
        self.urlString = urlString
        self.downloadPath = downloadPath
        
        if (self.success != nil) {
            self.success!()
        }
    }
}

extension DownloadModel:URLSessionDownloadDelegate,URLSessionDataDelegate,URLSessionDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    
    
}
