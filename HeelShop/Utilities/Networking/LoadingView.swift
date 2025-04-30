//
//  LoadingView.swift
//  HeelShop
//
//  Created by Nicholas Nguyen on 1/14/25.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context _: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(named: "tarheel")
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }

    func updateUIView(_: UIActivityIndicatorView, context _: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)

            ActivityIndicator()
        }
    }
}
