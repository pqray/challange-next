
import UIKit


class cell: UICollectionViewCell {
    
    private let profileImageView: MarvelImageView = {
        let cv = MarvelImageView()
        cv.contentMode = .scaleAspectFit
        cv.clipsToBounds = true
        cv.setDimensions(width: 48, height: 48)
        cv.layer.cornerRadius = 48 / 2
        cv.backgroundColor = .red
        return cv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0


        return label
    }()
    
    private let infosApp: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0

        return label
    }()
    
//    private let infoLabel = UILabel()

    override init (frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 8)
        
        let stack = UIStackView(arrangedSubviews: [nameLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingRight: 12)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func renderDataToCell(_ model: CharacterModel?) {
    
        guard let characterModel = model else {
            return
        }

//       infoLabel.isHidden = characterModel.description ?? "" == "" ? true : false
        
        nameLabel.text = characterModel.name
//
//        infoLabel.text = characterModel.description
        

        let urlString = (characterModel.thumbnail?.path ?? "") + "." + (characterModel.thumbnail?.imageExtension ?? "")
        profileImageView.downloadImageFrom(urlString: urlString, imageMode: .scaleAspectFill)

    }
    
}
