//
//  ViewController.swift
//  Artable
//
//  Created by Shahzaman Khan on 11/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let navigationVC = storyboard.instantiateViewController(withIdentifier: StoryboardIDs.LoginVC)
        navigationVC.modalPresentationStyle = .overFullScreen
        present(navigationVC, animated: true)
    }
}

