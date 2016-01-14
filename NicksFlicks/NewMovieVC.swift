//
//  NewMovieVC.swift
//  NicksFlicks
//
//  Created by Nick on 1/12/16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class NewMovieVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addImgBtn: UIButton!
    let DescriptionPlaceholder = "Description"
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        // Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Make Text View look like Text Field
        descriptionTextView.delegate = self
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor(hex: 0xececec).CGColor
        descriptionTextView.layer.cornerRadius = 8
        
        applyPlaceholderStyle(descriptionTextView, placeholderText: DescriptionPlaceholder)
    }
    
    @IBAction func addImagePressed(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
        addImgBtn.setTitle("", forState: .Normal)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    
    /*** Placeholder functionality for TextView ***/
    
    func applyPlaceholderStyle(aTextview: UITextView, placeholderText: String)
    {
        // make it look (initially) like a placeholder
        aTextview.textColor = UIColor(hex: 0xcfcfcf)
        aTextview.text = placeholderText
    }
    
    func applyNonPlaceholderStyle(aTextview: UITextView)
    {
        // make it look like normal text instead of a placeholder
        aTextview.textColor = UIColor.darkTextColor()
        aTextview.alpha = 1.0
    }
    
    func textViewShouldBeginEditing(aTextView: UITextView) -> Bool
    {
        if aTextView == descriptionTextView && aTextView.text == DescriptionPlaceholder
        {
            // move cursor to start
            moveCursorToStart(aTextView)
        }
        return true
    }
    
    func moveCursorToStart(aTextView: UITextView)
    {
        dispatch_async(dispatch_get_main_queue(), {
            aTextView.selectedRange = NSMakeRange(0, 0);
        })
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let newLength = textView.text.utf16.count + text.utf16.count - range.length
        if newLength > 0 {
            if textView == descriptionTextView && textView.text == DescriptionPlaceholder {
                applyNonPlaceholderStyle(textView)
                textView.text = ""
            }
            return true
        } else {
            applyPlaceholderStyle(textView, placeholderText: DescriptionPlaceholder)
            moveCursorToStart(textView)
            return false
        }
    }
}
