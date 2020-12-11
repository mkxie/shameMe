//
//  AnimatedImageView.swift
//  shameMe-app
//
//  Created by Matthew Xie on 12/7/20.
//  credit to https://medium.com/@intelecture/how-to-use-flanimatedimage-with-swiftui-3bd64a13ef4a
//

import SwiftUI
import FLAnimatedImage

struct AnimatedImageView : UIViewRepresentable {
    
    let animatedView = FLAnimatedImageView()
    var fileName : String
    
    func makeUIView(context: UIViewRepresentableContext<AnimatedImageView>) -> UIView {
        let view = UIView()
        
        let path : String = Bundle.main.path(forResource: fileName, ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf: url)
        
        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif
        
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimatedImageView>) {
        
    }
}


