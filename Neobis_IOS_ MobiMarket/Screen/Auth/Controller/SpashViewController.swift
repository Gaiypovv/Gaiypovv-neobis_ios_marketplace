//
//  SpashViewController.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation
import UIKit
import SnapKit

class SplashViewController: UIViewController{
    
    let shopImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shopping-cart 1-2")
        
        return image
    }()
    
    let mobiMarketLabel: UILabel = {
        let label = UILabel()
        label.text = "MOBI MARKET"
        label.font = UIFont(name: "Nunito-ExtraBold", size: 18)
        label.textColor = .black
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(shopImage)
        view.addSubview(mobiMarketLabel)
    }
    
    
    
    func setupConstraints() {
        
        shopImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(219 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(383 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(72 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(103 * UIScreen.main.bounds.width / 375)
        }
        
        mobiMarketLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(433 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(335 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(72 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(72 * UIScreen.main.bounds.width / 375)
        }
    }
}
