//
//  DoughnutViewController.swift
//  donut-selfie
//
//  Created by Andrew Breckenridge on 10/23/14.
//  Copyright (c) 2014 sprinkles. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class DoughnutViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        println(managedObjectContext!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func nutButtonWasHit(sender: AnyObject) {
        println("lol")
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
            })
        alertController.addAction(UIAlertAction(title: "Take Video", style: .Default) { (action) in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .Camera
            })
        alertController.addAction(UIAlertAction(title: "Add From Camera Roll", style: .Default) { (action) in
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.allowsEditing = true
            picker.sourceType = .PhotoLibrary
            })
        
        self.presentViewController(alertController, animated: true) {
        }
    }
    
    
    //MARK: UIImagePickerControllerDelegate Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary!) {
        let moviePath = info.objectForKey(UIImagePickerControllerMediaURL) as String
        let movieUrl: NSURL = info.objectForKey(UIImagePickerControllerMediaURL)! as NSURL
        let movieData: NSData = NSData(contentsOfURL: movieUrl)!
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        // at this point store the picker.chosenItem in the documents, generate a url, and store that in a new nut obj
        
        //
        // self.generateThumbnail(<#url: NSURL#>)
        
    }
    
    func generateThumbnail(url: NSURL) -> UIImage {
        let image = UIImage(named: "lol")
        return image!;
    }
}
