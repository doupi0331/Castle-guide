//
//  EnglandHotel1TableViewController.swift
//  Castle guide
//
//  Created by Yi-Yun Chen on 2017/11/8.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class HotelTableViewController: UITableViewController {

    @IBOutlet weak var castleImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var picIndex = 0
    var fileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileName = HOTELS[self.view.tag].fileName
        
        self.view.isUserInteractionEnabled = true
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeAction))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }

    @objc func swipeAction(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                if picIndex >= 1 && picIndex < 4 {  // 圖2~4才可往右滑
                    picIndex -= 1
                    pageControl.currentPage = picIndex
                    castleImageView.image = UIImage(named: "\(fileName)\(picIndex + 1)")
                    print("\(picIndex)")
                }
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                if picIndex >= 0 && picIndex < 3 { // 圖1~3才可往左滑
                    picIndex += 1
                    pageControl.currentPage = picIndex
                    castleImageView.image = UIImage(named: "\(fileName)\(picIndex + 1)")
                    print("\(picIndex)")
                }
            default:
                break
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

}
