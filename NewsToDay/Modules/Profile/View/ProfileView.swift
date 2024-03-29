import Foundation
import UIKit
import SnapKit

final class ProfileView: UIView {
    
    private var navigationController: UINavigationController?
    private var dataSource: [ProfileCellModel] = []
    private let profileImageKey = "profileImageKey"
    
    // MARK: - Views
    private lazy var profileMainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProfileMainTableViewCell.self, forCellReuseIdentifier: ProfileMainTableViewCell.reuseIdentifier)
        tableView.register(ProfileInfoTableViewCell.self, forCellReuseIdentifier: ProfileInfoTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setViews()
            layoutViews()
            loadProfileImage()
        }

        init(frame: CGRect, dataSource: [ProfileCellModel], navigationController: UINavigationController?) {
            self.navigationController = navigationController
            super.init(frame: frame)
            self.dataSource = dataSource
            setViews()
            layoutViews()
            loadProfileImage()
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    // MARK: Set Views
    private func setViews() {
        [profileMainTableView].forEach { self.addSubview($0) }
    }
    
    // MARK: Layout Views
    func layoutViews() {
        
        profileMainTableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func loadProfileImage() {
        guard let profileCell = profileMainTableView.visibleCells.compactMap({ $0 as? ProfileMainTableViewCell }).first,
              let imageData = UserDefaults.standard.data(forKey: profileImageKey),
              let profileImage = UIImage(data: imageData) else {
            return
        }
        
        profileCell.profileImage.image = profileImage
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ProfileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileMainTableViewCell.reuseIdentifier, for: indexPath) as? ProfileMainTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            return cell
            
        case 1, 2, 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileInfoTableViewCell.reuseIdentifier, for: indexPath) as? ProfileInfoTableViewCell else { return UITableViewCell() }
            cell.setTitlesAndImage(title: dataSource[indexPath.row - 1].title, image: dataSource[indexPath.row - 1].image ?? UIImage())
            cell.selectionStyle = .none
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 72
        case 1:
            return 240 + 56 + 44
        case 2, 3:
            return 56 + 44
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell tapped #\(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            profileImageTapped()
            
        case 1:
            let languageViewController = LanguageViewController()
            navigationController?.pushViewController(languageViewController, animated: true)
            
        case 2:
            let termsConditionsViewController = TermsConditionsViewController()
            navigationController?.pushViewController(termsConditionsViewController, animated: true)
            
        default:
            break
        }
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
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ProfileView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            if let profileCell = profileMainTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ProfileMainTableViewCell {
                profileCell.profileImage.image = selectedImage
                
                // Save the selected image to UserDefaults
                saveImageToUserDefaults(image: selectedImage)
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func saveImageToUserDefaults(image: UIImage) {
        // Compress the image data
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: profileImageKey)
        }
    }
}
