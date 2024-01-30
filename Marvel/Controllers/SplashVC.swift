//
//  SplashVC.swift
//  Marvel
//
//  Created by Shaima Yassen on 30/01/2024.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "marvel-logo-2D20B064BD-seeklogo.com")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            
            self.navigationController?.pushViewController(MainVC(), animated: true)
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
