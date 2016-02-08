//
//  GettingStartedViewController.swift
//  assignment1
//
//  Created by CloudLabs, Inc. on 2/7/16.
//  Copyright © 2016 Codepath. All rights reserved.
//

import UIKit

class GettingStartedViewController: UIViewController {

    @IBOutlet weak var favoriteOff: UIImageView!
    @IBOutlet weak var favoriteOn: UIImageView!
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidAppear(animated: Bool) {
        if (defaults.boolForKey("isFavoriteHidden")) {
            //Unfavored state
            favoriteOn.hidden = true
            favoriteOff.hidden = false
        }
        else {
            //Favored state
            favoriteOff.hidden = true
            favoriteOn.hidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onFavoriteAction(sender: AnyObject) {
        
        //Favorite -> Unfavorite
        if (favoriteOff.hidden){
            favoriteOn.hidden = true
            favoriteOff.hidden = false
            defaults.setBool(true, forKey: "isFavoriteHidden")
        }
        //Unfavorite -> Favorite
        else {
            favoriteOff.hidden = true
            favoriteOn.hidden = false
            defaults.setBool(false, forKey: "isFavoriteHidden")
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
