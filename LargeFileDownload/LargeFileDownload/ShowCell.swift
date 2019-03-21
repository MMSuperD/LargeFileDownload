//
//  ShowCell.swift
//  LargeFileDownload
//
//  Created by sh-lx on 2019/3/21.
//  Copyright © 2019年 WangDan. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

    @IBOutlet weak var rateTitleLabel: UILabel!
    
    // tag = 100
    @IBOutlet weak var downloadButton: UIButton!
    
    // tag = 101
    @IBOutlet weak var cancelButton: UIButton!
    
    //进度条
    @IBOutlet weak var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    /// 下载 或者取消
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func actionBtn(_ sender: UIButton) {
        
        switch sender.tag {
        case 100:
            print("start")
        case 101:
            print("cancel")
        default:
            print("嘿嘿")
        }
        
    }
    
}
