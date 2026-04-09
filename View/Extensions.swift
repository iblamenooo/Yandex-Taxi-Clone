//
//  Extensions.swift
//  Yandex Taxi Clone
//
//  Created by Nurtore on 06.04.2026.
//
import UIKit
import MapKit

extension UIView {
    //переиспользуемый UI Builder Method
    func containterInputView(image:UIImage, textField:UITextField? = nil, segmentedControl: UISegmentedControl? = nil) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        view.addSubview(imageView)
        
        if let textField = textField {
            imageView.centerY(inView: view)
            imageView.anchor(left:view.leftAnchor, paddingLeft:8, width:24, height:24)
            
            view.addSubview(textField)
            
            textField.centerY(inView:view)
            textField.anchor(left:imageView.rightAnchor, bottom:view.bottomAnchor, right:view.rightAnchor, paddingLeft:8, paddingBottom:8)
        }
        
        if let sc = segmentedControl {
            imageView.anchor(top:view.topAnchor, left:view.leftAnchor, paddingTop:-8, paddingLeft:8, width:24, height:24)
            view.addSubview(sc)
            sc.centerY(inview:view, constant:8)
            sc.anchor(left:view.leftAnchor, right:view.rightAnchor, paddingLeft:8, paddingRight:8)
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(left:view.leftAnchor, botttom:view.bottomAnchor, right:view.rightAnchor, paddingLeft:8, height:0.75 )
        
        return view
    }
}
