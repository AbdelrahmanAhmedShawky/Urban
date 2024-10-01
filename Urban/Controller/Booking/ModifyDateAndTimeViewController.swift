//
//  ModifyDateAndTimeViewController.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/30/24.
//

import UIKit

class ModifyDateAndTimeViewController: BaseViewController {

    @IBOutlet weak var collectionView: IntrinsicCollectionView!
    @IBOutlet weak var dateTextField: UITextField!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        hideNavigation()
        configureUI()
        // Do any additional setup after loading the view.
    }
    

    private func configureUI() {
        
        collectionView.register(UINib.init(nibName: "TimeSlotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeSlotCollectionViewCell")
        updateUI()
    }
    
    private func updateUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func calendarAction(_ sender: Any) {
        
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

extension ModifyDateAndTimeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeSlotCollectionViewCell", for: indexPath) as? TimeSlotCollectionViewCell else { return UICollectionViewCell() }
        if indexPath.row == selectedIndex{
            cell.gradientView.isHidden = false
        }else{
            cell.gradientView.isHidden = true
        }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width / 2.05, height: 45.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
    }
}
