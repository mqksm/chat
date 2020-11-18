//
//  ParserProtocol.swift
//  chat
//
//  Created by Maks on 17.11.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

protocol ParserProtocol {
    associatedtype Model
    func parse(data: Data) -> Model?
}
