//
//  LanguageViewController.swift
//  NewsToDay
//
//  Created by Ilya on 21.03.2024.
//

import UIKit

final class LanguageViewController: UIViewController {

    let dataSource: [ProfileCellModel] = [
        ProfileCellModel(title: NSLocalizedString("LanguageEnglish", comment: ""), image: UIImage(named:"Selected")),
        ProfileCellModel(title: NSLocalizedString("LanguageRussian", comment: ""), image: UIImage(named:"Selected")),
    ]

    private func getDataSource() -> [ProfileCellModel] {
        return dataSource
    }

    private lazy var languageView = LanguageView(frame: .zero, dataSource: self.getDataSource(), navigationController: navigationController)

    override func viewDidLoad() {
        super.viewDidLoad()


        languageView.languageTapCallBack = { index in
            switch index {
            case 0:
                self.setLangauge(languageCode: "en", language: "en")
            case 1:
                self.setLangauge(languageCode: "ru", language: "en")

            default:
                break
            }
        }

        let backButtonImage = UIImage(named: "BackImage")?.withRenderingMode(.alwaysOriginal)

        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(languageView)


        languageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }




    private func setLangauge(languageCode: String, language: String) {
        let alert = UIAlertController(title: nil, message: "Changing language", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "exit" , style: .default, handler: { (_) in
            // Update app's language with the language code
            UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()

            exit(EXIT_SUCCESS)
        }))

        // Show change language alert to user
        self.present(alert, animated: true, completion: nil)
    }
}
