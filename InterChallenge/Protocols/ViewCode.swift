//
//  ViewCode.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import Foundation

protocol ViewCode {
    func addSubViews()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        addSubViews()
        setupContraints()
        setupAdditionalConfiguration()
    }
}
