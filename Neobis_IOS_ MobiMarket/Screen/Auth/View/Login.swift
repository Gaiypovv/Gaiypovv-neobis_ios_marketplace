//
//  Login.swift
//  neobis_ios_marketplace
//
//  Created by Eldar Gaiypov on 29/6/23.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView, UITextFieldDelegate{
    
    
    let shopImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shopping-cart 1")
        return image
    }()
    
    
    let mobiMarketLabel : UILabel = {
        let label = UILabel()
        label.text = "MOBI MARKET"
        label.font = UIFont(name: "Nunito-ExtraBold", size: 18)
        label.textColor = .black
        
        return label
    }()
    
    let nameTF: AnimatedTF = {
        let field = AnimatedTF()
        field.placeholder = "Имя пользователя"
        
        let line = UIView()
        line.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        return field
    }()
    
    let underNameLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        return view
    }()
    
    let passwordTF: AnimatedTF = {
        let field = AnimatedTF()
        field.placeholder = "Пароль"
        field.isSecureTextEntry = true
        
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.setImage(UIImage(named: "eye-disabled"), for: .normal)
        button.setImage(UIImage(named: "eye"), for: .selected)
        button.frame = CGRect(x: CGFloat(field.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(LoginView.self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        field.rightView = button
        field.rightViewMode = .always

        return field
    }()
    
    let underPasswordLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        return view
    }()
    
    let enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
        button.layer.cornerRadius = 23 * UIScreen.main.bounds.height / 812
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 14)
        
        return button
    }()
    
    let statusLabel: UIView = {
        let view = UIView()
        let label = UILabel()
        let imageView = UIImageView()
        label.text = "Неверный логин или пароль"
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        label.textColor = .white
        
        imageView.image = UIImage(named: "warning")
        
        view.addSubview(label)
        view.addSubview(imageView)
        view.backgroundColor = UIColor(red: 0.954, green: 0.27, blue: 0.27, alpha: 1)
        view.isHidden = true
        view.layer.cornerRadius = 16 * UIScreen.main.bounds.height / 812
        
        label.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{ make in
            make.trailing.equalTo(label.snp.leading).inset(-6 * UIScreen.main.bounds.width / 375)
            make.centerY.equalToSuperview()
            make.height.equalTo(24 * UIScreen.main.bounds.height / 812)
            make.width.equalTo(24 * UIScreen.main.bounds.width / 375)
        }
        
        return view
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
        passwordTF.delegate = self
        
        enterButton.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
    }
    
    func setupViews() {
        addSubview(shopImage)
        addSubview(mobiMarketLabel)
        addSubview(nameTF)
        addSubview(underNameLine)
        addSubview(passwordTF)
        addSubview(underPasswordLine)
        addSubview(enterButton)
        addSubview(registerButton)
        addSubview(statusLabel)
    }
    
    func setupConstraints() {
        shopImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(60 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(672 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(133 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(162 * UIScreen.main.bounds.width / 375)
        }
        
        mobiMarketLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(148 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(639 * UIScreen.main.bounds.height / 812)
            $0.centerX.equalToSuperview()
        }
        
        nameTF.snp.makeConstraints{
            $0.top.equalToSuperview().inset(293 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(484 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
        }
        
        underNameLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(nameTF.snp.bottom)
            $0.leading.equalTo(nameTF.snp.leading)
            $0.trailing.equalTo(nameTF.snp.trailing)
        }
        
        passwordTF.snp.makeConstraints{
            $0.top.equalToSuperview().inset(379 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(397 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
        }
        
        underPasswordLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalTo(passwordTF.snp.bottom)
            $0.leading.equalTo(passwordTF.snp.leading)
            $0.trailing.equalTo(passwordTF.snp.trailing)
        }
        
        enterButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(497 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(271 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(20 * UIScreen.main.bounds.width / 375)
        }
        
        registerButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(737.5 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(57.5 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(112.5 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(112.5 * UIScreen.main.bounds.width / 375)
        }
        
        statusLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(44 * UIScreen.main.bounds.height / 812)
            $0.bottom.equalToSuperview().inset(708 * UIScreen.main.bounds.height / 812)
            $0.leading.equalToSuperview().inset(28 * UIScreen.main.bounds.width / 375)
            $0.trailing.equalToSuperview().inset(28 * UIScreen.main.bounds.width / 375)
        }
    }
    
    @objc func enterButtonPressed() {
        
        
        
    }
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.endEditing(true)
    }
    
    func textFieldShouldReturn(_ LoginTextField: UITextField) -> Bool {
        LoginTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedName = textField == nameTF ? (textField.text as NSString?)?.replacingCharacters(in: range, with: string) : nameTF.text
        let updatedPassword = textField == passwordTF ? (textField.text as NSString?)?.replacingCharacters(in: range, with: string) : passwordTF.text
        
        if let name = updatedName, let password = updatedPassword {
            enterButton.isEnabled = name.count >= 3 && password.count >= 8
            
            if enterButton.isEnabled {
                enterButton.backgroundColor = UIColor(red: 93/255, green: 95/255, blue: 249/255, alpha: 1.0)
            } else {
                enterButton.backgroundColor = UIColor(red: 0.754, green: 0.754, blue: 0.754, alpha: 1)
            }
        }
        
        
        return true
    }
}
