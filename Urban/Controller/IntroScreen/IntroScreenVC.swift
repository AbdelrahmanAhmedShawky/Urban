//
//  IntroScreenVC.swift
//  Urban
//
//  Created by Zain on 28/08/2024.
//

import UIKit
import ImageSlideshow
import CHIPageControl

class IntroScreenVC: UIViewController, LoginVCDelegate {
    func close() {
        dismiss(animated: true)
    }
    
    
    @IBOutlet weak var imageSlideshow: ImageSlideshow!
    @IBOutlet weak var pageControl: CHIPageControlJaloro!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleOTPSuccess(_:)), name: Notification.Name("otpsuccess"), object: nil)

        // Do any additional setup after loading the view.
    }
    @objc func handleOTPSuccess(_ notification: Notification) {
        if let userInfo = notification.userInfo,
           let dialcode = userInfo["dialcode"] as? String,
           let number = userInfo["number"] as? String {
            // Use dialcode and number here
            Coordinator.goToRegister(delegate:self,dialCode:dialcode,mobile:number)
            print("Received dialcode: \(dialcode), number: \(number)")
        }
        
    }

    func setData() {
        self.imageSlideshow.pageIndicator  = nil
        self.imageSlideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        self.imageSlideshow.setImageInputs([
            ImageSource(image: UIImage(named: "maidImg")!),
            ImageSource(image: UIImage(named: "maidImg")!),
            ImageSource(image: UIImage(named: "maidImg")!),
            ImageSource(image: UIImage(named: "maidImg")!)
        ])
        imageSlideshow.slideshowInterval = 3.0
        imageSlideshow.currentPageChanged = { [weak self] page in
            self?.pageControl.set(progress: page, animated: true)
        }
        pageControl.tintColor = UIColor(hex: "#F2ECD6")
        pageControl.numberOfPages = 4
    }
    @IBAction func startTab(_ sender: UIButton) {
        let dropDownVC = Storyboard.intro.instance.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        dropDownVC.delegate = self
        dropDownVC.modalPresentationStyle = .overFullScreen
        self.present(dropDownVC, animated: true, completion: nil)
        
    }
    @IBAction func skipPressed(_ sender: UIButton) {
        Coordinator.gotoTabbar()
    }

}


