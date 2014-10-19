//
//  DetailViewController.swift
//  donut-selfie
//
//  Created by Andrew Breckenridge on 10/19/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var videoCollectionView: UICollectionView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    func mergeVideos() -> Void {
        
    }
    
    func generateThumbnail(url: NSURL) -> UIImage {
        let asset = AVURLAsset(URL: url, options: nil)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        imageGenerator.appliesPreferredTrackTransform = true
        
        thumbTime: CMTime? = CMTimeMakeWithSeconds(0, preferredTimeScale: 12)
        
        handler = AVAssetImageGeneratorCompletionHandler({(requestedTime: CMTime?, im: CGImageRef?, actualTime: CMTime?, result: AVAssetImageGeneratorResult?, error: NSError?) do
            if (result != .Succeeded) {
                println("Couldn't generate thumbnail")
            }
            thumbImage = UIImage(CGImage: im)
        })
        
        return thumbImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videoCollectionView.dataSource = self
        videoCollectionView.delegate = self
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = videoCollectionView.dequeueReusableCellWithReuseIdentifier("cellID", forIndexPath: indexPath) as UICollectionViewCell
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

}

