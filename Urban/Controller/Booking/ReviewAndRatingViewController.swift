//
//  ReviewAndRatingViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/30/24.
//

import UIKit
import Cosmos

class ReviewAndRatingViewController: BaseViewController {

    @IBOutlet weak var starView: CosmosView!
    @IBOutlet weak var reviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigation()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func submitAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func closeTb(_ sender: UIButton) {
        self.dismiss(animated: true){
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
