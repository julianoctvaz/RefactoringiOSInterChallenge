//
//  TemplateView.swift
//  InterChallenge
//
//  Created by Juliano Vaz on 13/10/21.
//

import Foundation
import UIKit

@propertyWrapper final class TemplateView<View: UIView> {
    
    private lazy var view: View = {
        let view = View(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var wrappedValue: View {
        return view
    }
}
