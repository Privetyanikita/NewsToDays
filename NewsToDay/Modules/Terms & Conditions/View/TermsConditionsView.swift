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
    
    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text=NSLocalizedString("termsAndConditionsLabel", comment: "")
        label.font = UIFont(name: "Inter-SemiBold", size: 24)
        label.textColor = UIColor(named: "BlackPrimary")
        label.numberOfLines = 1
        return label
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
        [backgroundView, mainTitleLabel, mainTextView].forEach { self.addSubview($0) }
    }
    
    // MARK: - Layout
    private func layoutViews() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        mainTitleLabel.snp.makeConstraints() {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(60)
        }
        mainTextView.snp.makeConstraints(){
                $0.top.equalTo(mainTitleLabel.snp.bottom)
                $0.left.right.bottom.equalToSuperview().inset(8)
            }
    }
    
}
