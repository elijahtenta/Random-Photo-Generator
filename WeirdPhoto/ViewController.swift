//
//  ViewController.swift
//  WeirdPhoto
//
//  Created by Eli  on 3/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeImageButton: UIButton!
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    let colors: [UIColor] = [
            .systemBlue,
            .systemPink,
            .systemGreen,
            .systemRed,
            .systemYellow,
            .systemOrange,
            .systemPurple,
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        changeImageButton.addTarget(self, action: #selector (tapButton), for: .touchUpInside)
        getRandomPhoto()
    }
    func getRandomPhoto()
    {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data (contentsOf: url)
                else
                {
                    return
                }
        imageView.image = UIImage(data: data)
    }
    @objc func tapButton () {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
}

