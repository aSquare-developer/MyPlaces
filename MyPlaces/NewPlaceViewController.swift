//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Artur Anissimov on 20.01.2020.
//  Copyright © 2020 Artur Anissimov. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }

    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath.row == 0 { // Первая ячейка [Изображение]
            
        } else {
            view.endEditing(true)
        }
        
    }
    
}

// MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    // Cкрываем клавиатуру по нажатию на кнопку "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
