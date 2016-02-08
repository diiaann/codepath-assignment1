//
//  CreateAccountFormViewController.swift
//  assignment1
//
//  Created by CloudLabs, Inc. on 2/7/16.
//  Copyright © 2016 Codepath. All rights reserved.
//

import UIKit

class CreateAccountFormViewController: UIViewController {

    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var pwWeakImage: UIImageView!
    @IBOutlet weak var pwSoSoImage: UIImageView!
    @IBOutlet weak var pwGoodImage: UIImageView!
    @IBOutlet weak var pwGreatImage: UIImageView!
    let alertController = UIAlertController(title: nil, message: "Before you Register, you must accept the Dropbox Terms of Service.", preferredStyle: .ActionSheet)
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.enabled = false
        fname.becomeFirstResponder()
        setupActionSheet()
    }
    
    func setupActionSheet(){
        let cancelAction = UIAlertAction(title: "I Agree", style: .Default) { (action) in
            self.performSegueWithIdentifier("createAccountSegue", sender: self)
        }
        
        alertController.addAction(cancelAction)
        let destroyAction = UIAlertAction(title: "View Terms of Service", style: .Default) { (action) in
            self.performSegueWithIdentifier("termsSegue", sender: self)

        }
        alertController.addAction(destroyAction)

    }

    
    func validateForm(){
        if (fname.text != "" && lname.text != "" && emailAddress.text != "" && password.text != "") {
            createButton.enabled = true
        }
    }
    
    func hidePasswordImages(){
        pwGreatImage.hidden = true
        pwGoodImage.hidden = true
        pwSoSoImage.hidden = true
        pwWeakImage.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFnameChange(sender: AnyObject) {
        validateForm()
    }

    @IBAction func onLnameChange(sender: AnyObject) {
        validateForm()
    }
    
    
    @IBAction func onEmailChange(sender: AnyObject) {
        validateForm()
    }
    
    @IBAction func onPasswordChange(sender: AnyObject) {
        validateForm()
        if (password.text?.characters.count > 12) {
            hidePasswordImages()
            pwGreatImage.hidden = false
        }
        else if (password.text?.characters.count > 8) {
            hidePasswordImages()
            pwGoodImage.hidden = false
        }
        else if (password.text?.characters.count > 5) {
            hidePasswordImages()
            pwSoSoImage.hidden = false
        }
        else if (password.text?.characters.count > 0) {
            hidePasswordImages()
            pwWeakImage.hidden = false
        }
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTouchCreate(sender: AnyObject) {
        self.presentViewController(alertController, animated: true) {
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
