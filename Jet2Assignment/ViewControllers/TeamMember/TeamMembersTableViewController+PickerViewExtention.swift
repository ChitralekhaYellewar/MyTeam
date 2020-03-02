//
//  TeamMembersTableViewController+PickerViewExtention.swift
//  Jet2Assignment
//
//  Created by Chitralekha Yellewar on 02/03/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import UIKit

extension TeamMembersTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            viewModel.getTeamMembersSortbyName()
        case 1:
            viewModel.getTeamMembersSortbyAge()
        default:
            viewModel.getTeamMembers()
        }
    }
    
}
