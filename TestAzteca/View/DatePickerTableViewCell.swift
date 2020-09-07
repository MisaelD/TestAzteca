//
//  DatePickerTableViewCell.swift
//  TestAzteca
//
//  Created by PorMientras on 07/09/20.
//  Copyright © 2020 Misael Delgado Saucedo. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var birthTextField : UITextField!
    
    var delegate : CellActionsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.datePicker(cell: self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }

}
