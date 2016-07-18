//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        
        self.emailTextField.delegate = self
        self.emailConfirmationTextField.delegate = self
        self.phoneTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordConfirmTextField.delegate = self
        
        self.submitButton.enabled = false
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        isValid(textField)
        
        
    }
    
    func isValid(textField: UITextField) {
        
        let emailTextFieldCheck = self.emailTextField.text!.containsString("@") && self.emailTextField.text!.containsString(".")
        
        let emailConfirmationCheck = emailTextField.text == emailConfirmationTextField.text
        
        let phoneTextCheck = self.phoneTextField.text!.characters.count >= 7
        
        let passwordTextCheck = self.passwordTextField.text!.characters.count >= 6
        
        let passwordConfirmation = passwordTextField.text == passwordConfirmTextField.text
        
        
        if textField === self.emailTextField{
            if emailTextFieldCheck{
                
                self.emailTextField.backgroundColor = UIColor.whiteColor()
                
            }
            else {
                animateTextField(self.emailTextField)}
        }
            
        else if textField === self.emailConfirmationTextField{
            if emailConfirmationCheck {
                self.emailConfirmationTextField.backgroundColor = UIColor.whiteColor()
            }
            else {
                animateTextField(self.emailConfirmationTextField)}
        }
            
        else if textField === self.phoneTextField{
            if  phoneTextCheck{
                self.phoneTextField.backgroundColor = UIColor.whiteColor()}
            else {
                animateTextField(self.phoneTextField)}
        }
            
        else if textField === self.passwordTextField{
            if passwordTextCheck{
                self.passwordTextField.backgroundColor = UIColor.whiteColor()
            }
            else {
                animateTextField(self.passwordTextField)}
        }
            
        else if textField === self.passwordConfirmTextField{
            if passwordConfirmation{
                self.passwordConfirmTextField.backgroundColor = UIColor.whiteColor()}
            else {
                animateTextField(self.passwordConfirmTextField)}
        }
        
        if emailTextFieldCheck && emailConfirmationCheck && phoneTextCheck && passwordTextCheck && passwordConfirmation {
            
            self.submitButton.enabled = true
            
        }
        
    }
    
    func animateTextField(textField: UITextField) {
        
        let savedText = textField.text
        textField.text = nil
        
        UIView.animateKeyframesWithDuration(0.25, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            
            UIView.setAnimationRepeatCount(3.0)
            textField.transform = CGAffineTransformMakeScale(0.98, 0.98)
            textField.backgroundColor = UIColor.redColor()
            self.view.layoutIfNeeded()
        
        }) { (true) in
                textField.transform = CGAffineTransformMakeScale(1, 1)
            textField.text = savedText
        }
        
    }
    
    func turnRed(textField: UITextField) {
        textField.backgroundColor = UIColor.redColor()}
    
    @IBAction func submitTapped(sender: AnyObject) {
        
        UIView.animateWithDuration(0.1, animations: {
            print("Something to print")
        })
    }
    
    
}