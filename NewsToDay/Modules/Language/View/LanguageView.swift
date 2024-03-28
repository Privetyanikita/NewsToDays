//
//  LanguageView.swift
//  NewsToDay
//
//  Created by Ilya on 21.03.2024.
//

import UIKit

final class LanguageView: UIView {
    
    private lazy var languageView: UIView = LanguageView().languageView
    private var navigationController: UINavigationController?
    private var dataSource: [ProfileCellModel] = []
    
    // MARK: - Views
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "CustomWhite")
        return view
    }()
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text=NSLocalizedString("LanguageLabel", comment: "")
        label.font = UIFont(name: "Inter-SemiBold", size: 24)
        label.textColor = UIColor(named: "BlackPrimary")
        label.numberOfLines = 1
        return label
    }()
    private lazy var MainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }
    
    init(frame: CGRect, dataSource: [ProfileCellModel], navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init(frame: frame)
        self.dataSource = dataSource
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func setViews() {
        [backgroundView, mainTitleLabel, MainTableView].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func layoutViews() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainTitleLabel.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(68)
        }
        MainTableView.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.bottom).offset(10) // Установим отступ между заголовком и таблицей
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    private func restartApp() {
        // Find the scene delegate
        guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            return
        }

        // Get the window from the scene delegate
        guard let window = sceneDelegate.window else {
            return
        }

        // Create a new instance of the root view controller
        let rootViewController = TabBarController()
        rootViewController.configure()
        rootViewController.setupTabBar()

        // Set the new instance as the root view controller
        window.rootViewController = rootViewController

        // Make the window visible
        window.makeKeyAndVisible()
    }
    
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension LanguageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.setTitlesAndImage(title: dataSource[indexPath.row].title , image:dataSource[indexPath.row].image ?? UIImage())
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            return cell
            
        case 1:
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0,1:
            return 45 + 45 // Высота для второй ячейки, немного меньше, чем для первой
        default:
            return UITableView.automaticDimension // Используем автоматическую высоту для остальных ячеек
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell tapped #\(indexPath.row)")
        
        switch indexPath.row {
        case 0:
            UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
            
        case 1:
            UserDefaults.standard.set(["ru"], forKey: "AppleLanguages")
            
        default:
            break
        }
        
        UserDefaults.standard.synchronize()
        restartApp()
    }
    
    
}

