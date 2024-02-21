//
//  PageViewController.swift
//  BT
//
//  Created by Mahima Personal on 21/02/24.
//

import UIKit

class PageViewController: UIViewController {
    private var pageController: UIPageViewController?
    var pageManager = PageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageController()
    }
    
    private func setupPageController() {
        self.pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageManager.getFirstVc { firstVc in
            if let vc = firstVc {
                self.pageController?.setViewControllers([vc], direction: .forward, animated: true)
            }
        }
        self.pageController?.dataSource = self
        self.pageController?.view.frame = self.view.bounds
        self.addChild(self.pageController!)
        self.view.addSubview(self.pageController!.view)
        self.pageController?.didMove(toParent: self)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        return pageManager.getPreviousPage(for: (viewController as? ViewController)?.index ?? 0)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return pageManager.getNextPage(for: (viewController as? ViewController)?.index ?? 0)
    }
    
    
}
