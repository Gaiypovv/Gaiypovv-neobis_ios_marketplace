//
//  RegistrationView.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation
import UIKit
import SnapKit

class RegistrationView: UIView, UITextFieldDelegate{
    
    let cartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shopping-cart 1")
        
        return image
    }()
    
    let marketLabel : UILabel = {
        let label = UILabel()
        label.text = "MOBI MARKET"
        label.font = UIFont(name: "Nunito-ExtraBold", size: 18)
        label.textColor = .black
        
        return label
    }()
    
    let nameTF: AnimatedTF = {
        let tf = AnimatedTF()
        tf.placeholder = "Имя пользователя"

        let line = UIView()
        line.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        tf.addSubview(line)

        line.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        return tf
    }()
    
    let mailTF: AnimatedTF = {
        let tf = AnimatedTF()
        tf.placeholder = "Почта"

        let line = UIView()
        line.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        tf.addSubview(line)

        line.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.bottom.trailing.equalToSuperview()
        }

        return tf
    }()
    
    let enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        button.layer.cornerRadius = 23 * UIScreen.main.bounds.height / 812
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        
        backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        nameTF.delegate = self
        mailTF.delegate = self
    }
    
    func setupViews() {
        addSubview(cartImage)
        addSubview(marketLabel)
        addSubview(nameTF)
        addSubview(mailTF)
        addSubview(enterButton)
    }
    
    func setupConstraints() {
        
        cartImage.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(133 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(162 * UIScreen.main.bounds.width / 375)
            $0.top.equalToSuperview().inset(112 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(620 * UIScreen.main.bounds.height / 812)
            
        }
        
        marketLabel.snp.makeConstraints{ i in
            i.bottom.equalToSuperview().inset(587 * UIScreen.main.bounds.height / 812)
            i.centerX.equalToSuperview()
            i.top.equalToSuperview().inset(200 * UIScreen.main.bounds.height / 812)
            
        }
        
        nameTF.snp.makeConstraints{ i in
            i.top.equalToSuperview().inset(293 * UIScreen.main.bounds.height / 812)
            i.bottom.equalToSuperview().inset(484 * UIScreen.main.bounds.height / 812)
            i.leading.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
            i.trailing.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
        }
        
        mailTF.snp.makeConstraints{
            $0.top.equalToSuperview().inset(379 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(397 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
        }
        
        enterButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(497 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(271 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
        }

    }
    
    
    
    // для сварачивания кнопок
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.endEditing(true)
    }
    
    func textFieldShouldReturn(_ LoginTextField: UITextField) -> Bool {
        LoginTextField.resignFirstResponder()
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedName = textField == nameTF ? (textField.text as NSString?)?.replacingCharacters(in: range, with: string) : nameTF.text
        let updatedMail = textField == mailTF ? (textField.text as NSString?)?.replacingCharacters(in: range, with: string) : mailTF.text
        
        if let name = updatedName, let mail = updatedMail {
            enterButton.isEnabled = name.count >= 3 && mail.contains("@")
            
            if enterButton.isEnabled {
                enterButton.backgroundColor = UIColor(red: 93/255, green: 95/255, blue: 249/255, alpha: 1.0)
            } else {
                enterButton.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
            }
            
            if mail.contains("@") {
                enterButton.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
            }
        }
        
        return true
    }
}

