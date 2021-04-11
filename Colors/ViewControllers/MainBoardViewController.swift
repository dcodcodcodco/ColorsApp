//
//  MainBoardViewController.swift
//  Colors
//
//  Created by Alex on 11.04.2021.
//

import UIKit

protocol ChangeColorViewControllerDelegate {
    func colorToMainVC(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat)
}

class MainBoardViewController: UIViewController {

    var viewColor: ChangeColorViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let changeColorVC = segue.destination as? ChangeColorViewController else { return }
        changeColorVC.colorForView = view.backgroundColor
        changeColorVC.delegate = self
    }
}

//MARK: - Extension
extension MainBoardViewController: ChangeColorViewControllerDelegate {
    func colorToMainVC(redColor: CGFloat, greenColor: CGFloat, blueColor: CGFloat) {
        view.backgroundColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
}
