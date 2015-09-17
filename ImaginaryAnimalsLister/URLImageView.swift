//
//  URLImageView.swift
//  ImaginaryAnimalsLister
//
//  Created by Madison White on 9/17/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

class URLImageView: UIImageView {

    var url: NSURL?{
        didSet {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { [weak self] () -> Void in
            
                
                guard let url = self?.url,
                    let imageData = NSData(contentsOfURL: url) else { return }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    guard let image = UIImage(data: imageData),
                        let _ = self?.superview else { return }
                    self?.image = image
                })
            }
        }
    }
}
