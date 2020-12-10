//
//  ViewController.swift
//  MVP
//
//  Created by Kevin ABRIOUX on 27/11/2020.
//

import UIKit

protocol ViewInterface {
    func onLabelChange(value: String)
}

class ViewController: UIViewController {
    
    lazy var presenter: ViewPresenterProtocol = ViewPresenter(view: self)
    
    lazy var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override func loadView() {
        super.loadView()
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.button)
        self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.button.backgroundColor = .red
        self.button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.label)
        self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: 20).isActive = true
        self.label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.label.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func onTap() {
        self.presenter.onTap()
    }
}

extension ViewController: ViewInterface {
    func onLabelChange(value: String) {
        self.label.text = value
    }
}
