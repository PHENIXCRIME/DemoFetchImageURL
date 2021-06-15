//
//  ViewController.swift
//  DemoFetchImageURL
//
//  Created by PHENIXCRIME on 15/6/2564 BE.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg"

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
        imageView.center = view.center
        
        fetchImage()
    }
    
    private func fetchImage() {
        // get data
        // convertthe data to image
        // set image to imageview
        guard let url = URL(string: urlString) else {
            return
        }
        let getDataTask = URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }
        
        getDataTask.resume()
    }


}

