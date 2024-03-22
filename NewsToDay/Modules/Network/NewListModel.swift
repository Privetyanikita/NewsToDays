//
//  NewListModel.swift
//  NewsToDay
//
//  Created by lukoom on 21.03.2024.
//

import Foundation


class NewListModel : ObservableObject {
    weak var newService = DI.shared.newsServices
    @Published var items = [NewsItem]()
    
    func loadNews() {
        newService?.loadNews { (result: Result<NewList?,Error>) in
            switch (result) {
            case.success(let news):
                self.items.removeAll()
                self.items.append(contentsOf: news?.articles ?? [NewsItem]())
            case .failure(_):
                print("Error")
            }
            
        }
    }
}
