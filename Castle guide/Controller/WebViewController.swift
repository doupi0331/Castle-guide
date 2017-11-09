//
//  WebViewController.swift
//  Castle guide
//
//  Created by Yi-Yun Chen on 2017/11/9.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var webside = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webside = HOTELS[self.view.tag].webside
        
        if let url = URL(string: webside) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
