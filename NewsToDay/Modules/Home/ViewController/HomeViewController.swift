//
//  ViewController.swift
//  NewsToDay
//
//  Created by NikitaKorniuk   on 17.03.2024.
//

import UIKit
import SnapKit
import Kingfisher


protocol BookmarkDelegate: AnyObject {
    func addToBookmarks(news: ListItem)
}

final class HomeViewController: UIViewController {
    //MARK: - Private Properties
    private let homeView = HomeView()
    private let sections = MockData.shared.pageData
    private let newsService = NewsService()
    ///выбранная категория
    private var selectedIndexPath: IndexPath?
    
    var newsData: [News]?
    var recNewsData: [News]?
    
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupViews()
        setDelegates()
        fetchRecommendedNews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ///установка начального значения для selectedIndexPath
        selectedIndexPath = IndexPath(item: 0, section: 1)
        homeView.collectionView.reloadData()
        fetchDataNews(forCategory: "")
    }
    
    //MARK: - Private methods
    private func setupViews() {
        homeView.collectionView.register(TextFieldCollectionViewCell.self, forCellWithReuseIdentifier: "TextFieldCollectionViewCell")
        homeView.collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        homeView.collectionView.register(LatestNewsCollectionViewCell.self, forCellWithReuseIdentifier: "LatestNewsCollectionViewCell")
        homeView.collectionView.register(RecomendedNewsCollectionViewCell.self, forCellWithReuseIdentifier: "RecomendedNewsCollectionViewCell")
        homeView.collectionView.register(HeaderSupplemetaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplemetaryView")
        
        homeView.collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        
    }
    
    private func fetchDataNews(forCategory category: String) {
        newsService.fetchNews(forCategory: category) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.newsData = data
                    self.homeView.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchRecommendedNews() {
        newsService.fetchNewNews(limitRequest: 10) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let news):
                DispatchQueue.main.async {
                    self.recNewsData = news
                    self.homeView.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch recommended news: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .textField(_):
                return self.createTextFieldSection()
            case .topics(_):
                return self.createTopicSection()
            case .news(_):
                return self.createNewsSection()
            case .recommended(_):
                return self.createRecommendedNewsSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createTextFieldSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                                                         heightDimension: .absolute(112)),
                                                       subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 16,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 32, trailing: 20)
        return section
    }
    
    private func createTopicSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(80),
                                                                         heightDimension: .absolute(32)),
                                                       subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 16,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 24, trailing: 20)
        return section
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(256),
                                                                         heightDimension: .absolute(256)),
                                                       subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 16,
                                          supplementaryItems: [],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 48, trailing: 20)
        return section
    }
    
    private func createRecommendedNewsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.95),
                                                                         heightDimension: .absolute(96)),
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.supplementariesFollowContentInsets = false
        section.interGroupSpacing = 16
        section.boundarySupplementaryItems = [supplementaryHeaderItem()]
        section.contentInsets = .init(top: 24, leading: 20, bottom: 16, trailing: 20)
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        ///устанавливаем выбранную ячейку в selectedIndexPath
        selectedIndexPath = indexPath
        ///обновляем коллекцию
        homeView.collectionView.reloadData()
        
        let section = sections[indexPath.section]
        switch section {
        case .textField(_):
            print("Поиск")
        case .topics(let topics):
            let selectedCategory = topics[indexPath.row].categories
            print("Выбранная категория: \(selectedCategory)")
            fetchDataNews(forCategory: selectedCategory)
            ///после выбора новой категории, выполнить скролл к началу
            homeView.collectionView.reloadData()
            homeView.collectionView.scrollToItem(at: IndexPath(item: 0, section: 2), at: .left, animated: true)
            
        case .news(_):
            print("Новости")
            guard let selectedNews = newsData?[indexPath.row] else { return }
            
            let detailVC = DetailViewController()
            detailVC.configure(with: selectedNews)
            navigationController?.pushViewController(detailVC, animated: true)
        case .recommended(_):
            print("Рекомендации")
            guard let selectedRecomendedData = recNewsData?[indexPath.row] else { return }
            
            let detailVC = DetailViewController()
            detailVC.configure(with: selectedRecomendedData)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section] {
        case .textField(_):
            return 1
        case .topics(let topics):
            return topics.count
        case .news(_):
            return 10
        case .recommended(_):
            if let recNews = recNewsData {
                if recNews.count > 5 {
                    return 5
                }
                if recNews.count < 5 {
                    return recNews.count
                }
            }
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .textField(_):
            guard let cell = homeView.collectionView.dequeueReusableCell(withReuseIdentifier: "TextFieldCollectionViewCell", for: indexPath) as? TextFieldCollectionViewCell else { return UICollectionViewCell() }
            
            cell.searchTextField.delegate = self
            return cell
        case .topics(let topics):
            guard let cell = homeView.collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
            ///isSelectedCell в зависимости от того, выбрана ли ячейка в данный момент
            cell.isSelectedCell = indexPath == selectedIndexPath
            
            if indexPath.row < topics.count {
                cell.configureCell(topicName: topics[indexPath.row].categories)
            }
            return cell
            
        case .news(_):
            guard let cell = homeView.collectionView.dequeueReusableCell(withReuseIdentifier: "LatestNewsCollectionViewCell", for: indexPath) as? LatestNewsCollectionViewCell else { return UICollectionViewCell() }
            
            if let dataNews = newsData, indexPath.item < dataNews.count {
                let newsDataItem = dataNews[indexPath.item]
                cell.configureCell(image: newsDataItem.urlToImage ?? "",
                                   newTopic: newsDataItem.author ?? "",
                                   news: newsDataItem.description ?? "")
            }
            cell.delegate = self
            return cell
            
        case .recommended(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecomendedNewsCollectionViewCell", for: indexPath) as? RecomendedNewsCollectionViewCell else { return UICollectionViewCell() }
            
            if let recNews = recNewsData, indexPath.item < recNews.count {
                let newsItem = recNews[indexPath.item]
                cell.configureCell(image: newsItem.urlToImage ?? "",
                                   newTopic: newsItem.title ?? "",
                                   news: newsItem.description ?? "")
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = homeView.collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                  withReuseIdentifier: "HeaderSupplemetaryView",
                                                                                  for: indexPath) as! HeaderSupplemetaryView
            header.configureHeader(labelName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}
//MARK: - AddViews
extension HomeViewController {
    private func addViews() {
        view.addSubview(homeView.collectionView)
        addConstraints()
    }
    
    private func addConstraints() {
        homeView.collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
//MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    
    private func fetchSearchData(text: String) {
        newsService.searchNews(query: text, limitRequest: 10) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    let searchResultsVC = SearchResultsViewController()
                    searchResultsVC.searchResults = data
                    self.navigationController?.pushViewController(searchResultsVC, animated: true)
                    
//                    ///если хотим показать результаты поиска в ячейке
//                    self.newsData = data
//                    self.homeView.collectionView.reloadSections(IndexSet(integer: 2))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Please enter your text"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let search = textField.text {
            fetchSearchData(text: search)
            textField.text = ""
        }
    }
}
//MARK: - BookmarkDelegate
extension HomeViewController: BookmarkDelegate {
    func addToBookmarks(news: ListItem) {
        BookmarkManager.shared.addBookmark(news)
        print(BookmarkManager.shared.bookmarkedItems.count)
        
        if let bookmarksVC = navigationController?.viewControllers.first(where: { $0 is BookmarksViewController }) as? BookmarksViewController {
            bookmarksVC.updateBookmarks()
        }
    }
}
