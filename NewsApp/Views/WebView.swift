//
//  WebView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import SwiftUI
import SafariServices

struct webView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
}
