//
//  ViewController.swift
//  AutoLayoutWithExtensions
//
//  Created by Elliot Glaze on 06/02/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redBox = UIView()
        redBox.backgroundColor = .red
        
        let blueBox = UIView()
        blueBox.backgroundColor = .blue
        
        let greenBox = UIView()
        greenBox.backgroundColor = .green
        
        [redBox, blueBox, greenBox].forEach {view.addSubview($0)}
        
        redBox.anchor(top: view.safeAreaLayoutGuide.topAnchor, trailing: view.trailingAnchor, bottom: nil, leading: nil, padding: .init(top: 0,left: 0,bottom: 0, right: 12), size: .init(width: 100, height: 100))
        blueBox.anchor(top: redBox.bottomAnchor, trailing: redBox.trailingAnchor, bottom: nil, leading: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        greenBox.anchor(top: redBox.topAnchor, trailing: redBox.leadingAnchor, bottom: blueBox.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
    }
    


}

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?,trailing: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?,leading: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0{
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0{
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        
        
        
        
        
    }
}



