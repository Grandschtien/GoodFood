//
//  ProfileViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileInformation = Bundle.main.decode(Profile.self, from: "Profile.json")
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var recipeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        setupButton()
        setupImageView()
    }
    

    private func setupTextFields() {
        self.emailTF.setUnderLine()
        self.phoneTF.setUnderLine()
        self.emailTF.isEnabled = false
        self.phoneTF.isEnabled = false
        self.nameLabel.text = profileInformation.name
        self.emailTF.text = profileInformation.email
        self.phoneTF.text = profileInformation.phone
    }
    
    private func setupButton() {
        self.recipeButton.layer.cornerRadius = 20
        self.recipeButton.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
    }
    
    private func setupImageView() {
        self.photoImageView.layer.cornerRadius = self.photoImageView.frame.height / 2
        self.photoImageView.image = UIImage(named: profileInformation.image ?? "photo.fill")
        self.photoImageView.contentMode = .scaleAspectFill
    }
    
    @IBAction func exitButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func recipeButtonAction(_ sender: UIButton) {
    }
}
