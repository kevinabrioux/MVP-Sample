//
//  ViewPresenter.swift
//  MVP
//
//  Created by Kevin ABRIOUX on 27/11/2020.
//

import Foundation

protocol ViewPresenterProtocol {
    var view: ViewInterface { get }
    func onTap()
    init(view: ViewInterface)
}

class ViewPresenter {
    let view: ViewInterface
    private var count: Int = 0
    
    required init(view: ViewInterface) {
        self.view = view
        self.view.onLabelChange(value: count.description)
    }
}

extension ViewPresenter: ViewPresenterProtocol {

    func onTap() {
        self.count += 1
        self.view.onLabelChange(value: count.description)
    }
}
