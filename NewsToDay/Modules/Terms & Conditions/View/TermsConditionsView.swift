//
//  TermsConditionsView.swift
//  NewsToDay
//
//  Created by Ilya on 20.03.2024.
//
import Foundation
import UIKit
import SnapKit

final class TermsConditionsView: UIView {
    
    private lazy var termsConditionsView: UIView = TermsConditionsView().termsConditionsView
    
    // MARK: - Views
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "CustomWhite")
        return view
    }()
    
    private let mainTextView: UITextView = {
        let textView = UITextView()
        textView.text=NSLocalizedString("termsAndConditionsMainText", comment: "")
        textView.font = UIFont(name: "Inter-Regular", size: 16)
        textView.textColor = UIColor(named: "GreyPrimary")
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.isSelectable = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func setViews() {
        [backgroundView, mainTextView].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func layoutViews() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainTextView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}
