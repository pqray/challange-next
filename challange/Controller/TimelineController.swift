//
//  TimelineController.swift
//  challange
//
//  Created by Rayssa Ribeiro on 12/09/22.
//

import UIKit

private let reuseIdentifier = "ChCell"

class TimelineController: UICollectionViewController {

    
    var characterViewModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        characterViewModel.delegate = self
        characterViewModel.getCharacterList()
    }

    
    func configureUI(){
        view.backgroundColor = .white
        collectionView.register(cell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let imageView = UIImageView(image: UIImage(named: "marvel"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 50, height: 50)
        navigationItem.titleView = imageView
    }
}

extension TimelineController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterViewModel.characterDataModel?.data?.results?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! cell
        cell.renderDataToCell(characterViewModel.characterDataModel?.data?.results?[indexPath.row])
 
        return cell
    }
}

extension TimelineController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: view.frame.width, height: 100)
    }
}


extension TimelineController: characterViewModelProtocol {
    
    func fetchListOfMarvelCharacters() {
        self.collectionView.reloadData()
    }
    
    func getErrorFrom(_ error: String) {
        Utils().showAlertView(title: "Error", messsage: error)
    }
    
    func getErrorCodeFromAPIResponse() {
        Utils().showAlertView(title: ErrorString.error.rawValue, messsage: ErrorString.serverMsg.rawValue)
    }
    
}
