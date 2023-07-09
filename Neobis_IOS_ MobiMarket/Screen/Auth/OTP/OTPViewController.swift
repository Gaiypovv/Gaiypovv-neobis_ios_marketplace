//
//  OTPViewController.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation
import UIKit
import SnapKit

class OTPViewController: UIViewController{
    
    let mainViewer = OTPView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewer()
    }
    
    
    func setupViewer() {
        view.addSubview(mainViewer)
        mainViewer.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
