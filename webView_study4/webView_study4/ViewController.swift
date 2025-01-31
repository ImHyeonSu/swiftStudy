//
//  ViewController.swift
//  webView_study4
//
//  Created by h2yn on 2024/11/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://2sam.net")
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation){
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView (_ webView: WKWebView, didFinish navigation: WKNavigation){
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView (_ webView: WKWebView, didFail navigation: WKNavigation){
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func checkUrl(_ url: String)-> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlStrng = "<hl> HTML String </h1><p> Stringを利用したウェブ</p><p><a href=\"http://2sam.net\">2sam.net</a>に移動</p>"
        myWebView.loadHTMLString(htmlStrng, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filepath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filepath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    

}

