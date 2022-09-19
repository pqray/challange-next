//
//  TimelineController.swift
//  challange
//
//  Created by Rayssa Ribeiro on 12/09/22.
//

import UIKit

class InfoController: UIViewController {
    
    
    private let logoMarvelView: UIImageView = {
        let iv = UIImageView()
//        iv.ContentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "marvel")
        
        return iv
        
    }()
    
    private let infosApp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0

        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Projeto info"
        view.addSubview(logoMarvelView)
        logoMarvelView.contentMode = .scaleAspectFit
        logoMarvelView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoMarvelView.setDimensions(width: 100, height: 100)
    
    }
    
}
