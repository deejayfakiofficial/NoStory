//
//  WelcomeViewController.swift
//  NoStory
//
//  Created by Stanislav Terentyev on 04.06.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Variables
    
    var slides: [WelcomeSlide] = []
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Начать", for: .normal)
            } else {
                nextButton.setTitle("Дальше", for: .normal)
            }
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifire, bundle: nil), forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifire)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        appendToSlides()
    }
    
    //MARK: - Functions

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        pageControl.currentPage = currentPage
        if currentPage == slides.count - 1 {
           let vc = MainViewController(nibName: "MainViewController", bundle: nil)
            self.present(vc, animated: true) {
                print("Pushed")
            }
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    private func appendToSlides() {
        let firstSlide = WelcomeSlide(title: "Просто", description: "Вы можете легко и быстро заказать еду", image: UIImage(imageLiteralResourceName: "Delivery") )
        let secondSlide = WelcomeSlide(title: "Информативно", description: "Посмотрите колличество каллорий в заказе", image: UIImage(imageLiteralResourceName: "LaunchScreen"))
        let thirdSlide = WelcomeSlide(title: "Быстро", description: "Доставим Ваш заказ втечение получаса", image: UIImage(imageLiteralResourceName: "Clock"))
        slides.append(firstSlide)
        slides.append(secondSlide)
        slides.append(thirdSlide)
    }
}

    //MARK: - EXTENSIONS

extension WelcomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifire, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        //        cell.frame = UIScreen.main.bounds
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

    

