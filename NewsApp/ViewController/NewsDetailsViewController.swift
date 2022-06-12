//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by Suraj Kumar Mandal on 12/06/22.
//

import UIKit
import WebKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var newsWebView: WKWebView!
    
    var newsURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Load webview using url
        let url = URL(string: newsURL)
        newsWebView.load(URLRequest(url: url!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
