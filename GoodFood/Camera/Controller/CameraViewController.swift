//
//  CameraViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class CameraViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  setupCamera()
    }
    private func setupCamera(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }

}

extension CameraViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        self.imageView.image = image
    }
    
}
