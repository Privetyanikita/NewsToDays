//
//  ProfileTableViewCell.swift
//  NewsToDay
//
//  Created by Ilya on 18.03.2024.
//

import UIKit
import FirebaseAuth

final class ProfileMainTableViewCell: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    static let reuseIdentifier = "ProfileMainTableViewCell"
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProfileImage")
        imageView.tintColor = .purplePrimary
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(named: "GreyLighter")
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Dev P"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-SemiBold", size: 16)
        label.textColor = UIColor(named: "BlackPrimary")
        label.numberOfLines = 1
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "dev@gmail.com"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = UIColor(named: "GreyPrimary")
        label.numberOfLines = 1
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        layoutViews()
        addGestureRecognizerToProfileImage()
        nameAndEmailCurrentUser()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.addSubview(profileImage)
        self.addSubview(nameLabel)
        self.addSubview(emailLabel)
    }
    
    private func layoutViews() {
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(72)
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
        }
        profileImage.layer.cornerRadius = 36
        
        nameLabel.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(24)
            $0.top.equalToSuperview().offset(15)
            $0.left.equalToSuperview().offset(96)
        }
        emailLabel.snp.makeConstraints {
            $0.width.equalTo(140)
            $0.height.equalTo(24)
            $0.top.equalTo(nameLabel.snp.bottom).inset(5)
            $0.left.equalToSuperview().offset(96)
        }
    }
    
    private func nameAndEmailCurrentUser(){
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.nameLabel.text = user.displayName
                self.emailLabel.text = user.email
            }
        }
    }
    
    private func addGestureRecognizerToProfileImage() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImage.addGestureRecognizer(tapGesture)
    }
    
    @objc private func profileImageTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController?.present(imagePickerController, animated: true, completion: nil)
            }
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                profileImage.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
