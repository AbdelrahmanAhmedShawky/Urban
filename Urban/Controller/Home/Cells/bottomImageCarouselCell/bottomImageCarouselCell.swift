//
//  bottomImageCarouselCell.swift
//  Urban
//
//  Created by Maaz Siddiqui on 8/27/24.
//

import UIKit

class bottomImageCarouselCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var mainTitleView: UIView!
    @IBOutlet weak var pageControlView: UIView!
    
    
    let activeImage = UIImage(named: "page-selected")
    let inactiveImage = UIImage(named: "page-unselected")
    
    var parent: UIViewController!
    var type: HomeDataBanners!
    var serviceData: [Service]?{
        didSet {
            updateUI()
        }
    }
    
    var bannerData: [BannerData]?{
        didSet {
//            pageControl.numberOfPages = bannerData?.count ?? 0
            if let firstImage = bannerData?.first {
                pageControl.numberOfPages = bannerData?.count ?? 0
//                imageView?.image = firstImage.image
                updateUI()
            }
//            updateUI()
        }
    }
    
    var pestData:[PestItem]? {
        didSet {
            updateUI()
        }
    }
//    var topBanner:[UIImage]? {
//        didSet {
//            pageControl.numberOfPages = topBanner?.count ?? 0
//            updateUI()
//        }
//    }

    
//    var topBanner: [UIImage]? {
//            didSet {
//                // Set the first image (or implement your carousel logic here)
//                if let firstImage = topBanner?.first {
//                    pageControl.numberOfPages = topBanner?.count ?? 0
//                    imageView?.image = firstImage
//                    updateUI()
//                }
//            }
//        }
    
    var titleText : String? {
        didSet{
            titleLabel.text = titleText
        }
    }
    
    var shouldHideViewAll : Bool = false {
        didSet{
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
        
        pageControl.setIndicatorImage(activeImage, forPage: pageControl.currentPage)
        
        for i in 0..<pageControl.numberOfPages {
            if i != pageControl.currentPage {
                pageControl.setIndicatorImage(inactiveImage, forPage: i)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureUI() {
        
        collectionView.register(UINib.init(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionCell")
       
        collectionView.register(UINib.init(nibName: "AllProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllProductsCollectionViewCell")
        
        collectionView.register(UINib.init(nibName: "PestControlCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PestControlCollectionViewCell")

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            layout.scrollDirection = .horizontal
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.collectionViewLayout.invalidateLayout()
        
        pageControl.numberOfPages = 4
    }
    
    private func updateUI(){
        collectionView.reloadData()
    }

}

extension bottomImageCarouselCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if type == .head {
            return  bannerData?.count ?? 0
        }else if type == .services{
            return serviceData?.count ?? 0
        }else if type == .pest{
            return pestData?.count ?? 0
        }
        return bannerData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if type == .head {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as? ImageCollectionCell
            else {
                return UICollectionViewCell()
            }
            
            let data = bannerData?[indexPath.row]
            cell.itemImageView.sd_setImage(with: URL(string: data?.image ?? ""), placeholderImage: UIImage(named: "placeholder_profile"))
            
            // Configure the cell for the .head type
            return cell
            
        } else if type == .services {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllProductsCollectionViewCell", for: indexPath) as? AllProductsCollectionViewCell else {
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
            
        } else if type == .pest {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PestControlCollectionViewCell", for: indexPath) as? PestControlCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = pestData?[indexPath.row]
            cell.pestImage.image = UIImage(named: data?.userImage ?? "")
            cell.bgImage.image = UIImage(named: data?.backgroundImage ?? "")
            cell.nameLabel.text = data?.name
            cell.priceLabel.text = data?.price
            return cell
        } else {
            return UICollectionViewCell() // In case `type` doesn't match any of the expected ones
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if type == .head{
            self.collectionView.bounds.size
        }else if type == .services{
            return CGSize(width: self.collectionView.frame.width / 1.5, height: self.collectionView.frame.height)
        }else if type == .pest{
            return CGSize(width: self.collectionView.frame.width / 2.3, height: self.collectionView.frame.height)
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
        
    }
}
