//
//  ImageCarouselCell.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit
import SDWebImage

class ImageCarouselCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var viewAllButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var arrowButton: UIButton!
    @IBOutlet weak var mainTitleView: UIView!
    @IBOutlet weak var pageControlView: UIView!
    
    
    let activeImage = UIImage(named: "page-selected")
    let inactiveImage = UIImage(named: "page-unselected")
    
    var parent: UIViewController!
    var type: HomeDataBanners!

    var serviceData: [Service]?{
        didSet {
            updateUI()
            collectionView.reloadData()
        }
    }
    
    var sliderData: [SliderData]?{
        didSet {
            updateUI()
            collectionView.reloadData()
        }
    }
    
    
    var topBanner:[UIImage]? {
        didSet {
            pageControl.numberOfPages = (topBanner?.count ?? 0) - 1
            collectionView.reloadData()
        }
    }

    var titleText : String? {
        didSet{
            titleLabel.text = titleText
        }
    }
    
    var shouldHideViewAll : Bool = false {
        didSet{
            viewAllButton.isHidden = shouldHideViewAll
            arrowButton.isHidden = shouldHideViewAll
            mainTitleView.isHidden = shouldHideViewAll
        }
    }
    
    var shouldHidePageControlView : Bool = false{
        didSet{
            pageControlView.isHidden = shouldHidePageControlView
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUI() {
//        collectionView.register(UINib.init(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionCell")
        
        
        //for top image carosel
        collectionView.register(UINib.init(nibName: "BannerImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BannerImageCollectionCell")
        //for all products
        collectionView.register(UINib.init(nibName: "AllProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllProductsCollectionViewCell")
        //for trending now
//        collectionView.register(UINib.init(nibName: "DetailImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DetailImageCollectionCell")

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .horizontal
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
        
        if pageControl.numberOfPages != 0 {
            pageControl.setIndicatorImage(activeImage, forPage: pageControl.currentPage)
            
            for i in 0..<pageControl.numberOfPages {
                if i != pageControl.currentPage {
                    pageControl.setIndicatorImage(inactiveImage, forPage: i)
                }
            }
        }
    }
    
    private func updateUI(){
        collectionView.delegate = self
    }

}

extension ImageCarouselCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if type == .head {
            return  sliderData?.count ?? 0
        }else if type == .services{
            return serviceData?.count ?? 0
        }
        return sliderData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if type == .head {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerImageCollectionCell", for: indexPath) as? BannerImageCollectionCell else {
//                fatalError("Cell with identifier BannerImageCollectionCell not found!")
                return UICollectionViewCell()
            }
            let data = sliderData?[indexPath.row]
            cell.bannerImageView.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: UIImage(named: "placeholder_profile"))
            
            return cell
        } else if type == .services {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllProductsCollectionViewCell", for: indexPath) as? AllProductsCollectionViewCell else {
//                fatalError("Cell with identifier AllProductsCollectionViewCell not found!")
                return UICollectionViewCell()
            }
            let data = serviceData?[indexPath.row]
            cell.itemImageView.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: UIImage(named: "placeholder_profile"))
            cell.itemNameLabel.text = data?.title
            if let price = data?.price {
                cell.itemPraceLabel.isHidden = false
                cell.itemPraceLabel.text = "AED \(price.value)"
            } else {
                cell.itemPraceLabel.isHidden = true
            }
            return cell
        }
        // Default case to return BannerImageCollectionCell if type doesn't match
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerImageCollectionCell", for: indexPath) as? BannerImageCollectionCell else {
//            fatalError("Cell with identifier BannerImageCollectionCell not found!")
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if type == .head{
            self.collectionView.bounds.size
        } else if type == .services {
            return CGSize(width: self.collectionView.frame.width / 1.2, height: 150)
        }
        
        return self.collectionView.bounds.size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if type == .services{
         //   Coordinator.goToCleaningChooseDateVC(delegate: parent)
            Coordinator.goToCleaningDetailsVC(delegate: parent)
        }
    }
}
