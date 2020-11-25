//
//  ConfigurableViewProtocol.swift
//  chat
//
//  Created by Maks on 27.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

protocol ConfigurableView {
    associatedtype ConfigurationModel
    
    func configure(with model: ConfigurationModel)
}
