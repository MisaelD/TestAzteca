//
//  Protocols.swift
//  TestAzteca
//
//  Created by PorMientras on 07/09/20.
//  Copyright © 2020 Misael Delgado Saucedo. All rights reserved.
//

import Foundation

protocol CellActionsDelegate {
    //func imageLoad()
    func cameraPhoto(cell : PhotoTableViewCell)
    func datePicker(cell: DatePickerTableViewCell)
}
