//
//  ViewController.swift
//  randomUserTestPrjc
//
//  Created by OverPowerPWND Keeper83 on 20/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    let apiController = APIController()
    
    let userImageView: UIImageView = {
        let userImage = UIImageView()
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.contentMode = .scaleAspectFit
        userImage.backgroundColor = .purple
        
        
        return userImage
    }()
    
    let descriptionText: UILabel = {
        let userDescription = UILabel()
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        userDescription.font = .boldSystemFont(ofSize: 18)
        userDescription.textAlignment = .center
        userDescription.text = "test text"
        
        return userDescription
    }()
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiController.getUser { (error) in
            if let error = error {
                NSLog("Error performing data task: \(error)")
            }
            DispatchQueue.main.async { [self] in
                let randomUser = apiController.users[0]
                self.descriptionText.text = "\(randomUser.name.first) \(randomUser.name.last)"
                guard let imageData = try? Data(contentsOf: randomUser.picture.large) else { fatalError() }
                self.userImageView.image = UIImage(data: imageData)
            }
        }
        
        view.addSubview(descriptionText)
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        
        let topContainerView = UIView()
        view.addSubview(topContainerView)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.addSubview(userImageView)
        
        userImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        userImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        userImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        userImageView.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
        descriptionText.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    }
}
