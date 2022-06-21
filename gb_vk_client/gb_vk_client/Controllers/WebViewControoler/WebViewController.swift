//
//  WebViewController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 08.06.2022.
//

import UIKit
import WebKit
import Alamofire

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !Session.shared.token.isEmpty,
           Session.shared.userId != "" {
            performSegue(withIdentifier: segueFromWebViewControllerToTabBarController, sender: nil)
        }
        
        vkAuthorization()
    }
    
    func vkAuthorization() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8189007"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "revoke", value: "1")
        ]
        
        guard let url = urlComponents.url else { return }
        
        let request = URLRequest(url: url)
            
            
        webView.load(request)
    }
    
}


extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let parameters = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String] ()) { result, parameter in
                var dict = result
                let key = parameter[0]
                let value = parameter[1]
                dict[key] = value
                return dict
            }
        
        guard let token = parameters["access_token"],
              let userId = parameters["user_id"] else { return }
        
        Session.shared.token = token
        Session.shared.userId = userId
        
        performSegue(withIdentifier: segueFromWebViewControllerToTabBarController, sender: nil)
        
        decisionHandler(.cancel)
    }
}


