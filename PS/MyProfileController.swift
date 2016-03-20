//
//  MyProfileController.swift
//  PS
//
//  Created by Yauheni Yarotski on 19.03.16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class MyProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    let kToAddPatnerSeg = "toAddPatnerSeg"

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var sexualOrienationTextField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    var imagePickerController: UIImagePickerController?
    var capturedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My profile"
        
        nameTextField.becomeFirstResponder()
        
        nameTextField.text = ""
        lastNameTextField.text = ""
        birthDateTextField.text = ""
        genderTextField.text = ""
        sexualOrienationTextField.text = ""
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        birthDateTextField.delegate = self
        genderTextField.delegate = self
        sexualOrienationTextField.delegate = self
        
        
        addPhotoButtonConfig()
        
        
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        performSegueWithIdentifier(kToAddPatnerSeg, sender: sender)
    }
    
    func addPhotoButtonConfig() {
//        if let image = addPhotoButton.imageView?.image {
        addPhotoButton.layer.cornerRadius = 40
            addPhotoButton.layer.masksToBounds = true
        addPhotoButton.layer.borderWidth = 3
        addPhotoButton.layer.borderColor = UIColor.whiteColor().CGColor
//        }
    }
    
    @IBAction func addPhotoButtonPressed(sender: UIButton) {
        
        
//            [self.userName resignFirstResponder];
        view.endEditing(true)
        
        
        
        showActionSheet(actions: [
            UIAlertAction(title: "Choose from library", style: .Default, handler: { (UIAlertAction) -> Void in
                self.showImagePicker(.PhotoLibrary)
            }),
            UIAlertAction(title: "Take profile photo", style: .Default, handler: { (UIAlertAction) -> Void in
//                self.showImagePicker(.Camera)
                self.showAlert(title: "No camera", okActionHandler: nil)
            }),
            UIAlertAction(title: ActionTitle.Cancel(), style: .Cancel, handler: { (UIAlertAction) -> Void in
                
            })
            ])
        
        
        
        
    }
    
    func showImagePicker(sourceType: UIImagePickerControllerSourceType) {
    let imagePickerController = UIImagePickerController()
        imagePickerController.modalPresentationStyle = .FullScreen
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        if sourceType == .Camera {
        
            imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.Camera)!
            
        }
        
        self.imagePickerController = imagePickerController
        
        presentViewController(self.imagePickerController!, animated: true, completion: nil)
        

    }
    

    

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag)
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    
    
    // MARK: - Navigation - UIImagePickerControllerDelegate
    
    
//    
//    // This method is called when an image has been chosen from the library or taken
//    // from the camera.
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        capturedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        addPhotoButtonChangeImage(capturedImage!)
        dismissViewControllerAnimated(true) { () -> Void in
            self.nameTextField.becomeFirstResponder()
        }
        imagePickerController = nil
    }
    
//    - (void)    imagePickerController:(UIImagePickerController *)picker
//    didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
//    self.capturedImage = [info valueForKey:UIImagePickerControllerEditedImage];
    
    func addPhotoButtonChangeImage(newImage:UIImage) {
    addPhotoButton.setImage(newImage, forState: .Normal)
        addPhotoButton.setBackgroundImage(newImage, forState: .Normal)
    }
    
//    [self addPhotoButtonChangeImage:self.capturedImage];
//    //    [self.manager addHerLable:self.capturedImage];
//    [self dismissViewControllerAnimated:YES completion:NULL];
//    self.imagePickerController = nil;
//    }
//    
//    - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//    [self dismissViewControllerAnimated:YES completion:NULL];
//    }
//    

//    
//    - (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
//    if (theTextField == self.userName) {
//    [self doneButtonPressed:nil];
//    }
//    return YES;
//    }
//    
//    
//    - (void)addPhotoButtonConfig {
//    //    UIImage *image = [self.manager loadHerLable];
//    //    [self.addImageButton setImage:image forState:UIControlStateNormal];
//    //    [self.addImageButton setBackgroundImage:image forState:UIControlStateNormal];
//    //    _addPhotoButton.layer.cornerRadius = 60;
//    //    _addPhotoButton.layer.masksToBounds = YES;
//    }
    

    



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == kToAddPatnerSeg {
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
            
        }
    }


}
