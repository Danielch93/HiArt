//
//  ViewConfigurationProtocol.swift
//  HiArt
//
//  Created by Daniel Charry on 1/03/22.
//

protocol ViewConfigurationProtocol: BaseView {

    func buildHierarchy()

    func setupContrains()

    func configureView()

    func setupEvents()
}

extension ViewConfigurationProtocol {
    func setupView() {
        self.buildHierarchy()
        self.setupContrains()
        self.configureView()
        self.setupEvents()
    }
}
