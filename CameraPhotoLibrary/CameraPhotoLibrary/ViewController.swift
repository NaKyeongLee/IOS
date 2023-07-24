//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by user on 2023/07/22.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        // 카메라 사용 가능 여부
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true // 이미지 저장 허용
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false // 편집 불가
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.") // 카메라 사용 불가 시 경고창
        }
    }
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    // 델리게이트 ㅁ메서드 구현하기
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString

        if mediaType.isEqual(to: "public.image" as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage

            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }

            imgView.image = captureImage
        }
        else if mediaType.isEqual(to: "public.movie" as String) {
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)

                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }

        self.dismiss(animated: true, completion: nil)
    }
    
    // 2. 사진이나 비디오 찍지 않고 취소 or 선택하지 않고 취소하는 경우에 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion:  nil)
    }
}

