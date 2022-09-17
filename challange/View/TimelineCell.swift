
import UIKit


class cell: UICollectionViewCell {
    
    private let profileImageView: UIImageView = {
        let cv = UIImageView()
        cv.contentMode = .scaleAspectFit
        cv.clipsToBounds = true
        cv.setDimensions(width: 48, height: 48)
        cv.layer.cornerRadius = 48 / 2
        cv.backgroundColor = .red
        return cv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "testezaoo"
        return label
    }()
    
    private let infoLabel = UILabel()

    override init (frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 8)
        
        let stack = UIStackView(arrangedSubviews: [infoLabel, nameLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        
        infoLabel.text = "teste"
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func renderDataToCell(_ model: CharacterModel?) {
    
        guard let characterModel = model else {
            return
        }

        infoLabel.isHidden = characterModel.description ?? "" == "" ? true : false
        
        nameLabel.text = characterModel.name
        
        infoLabel.text = characterModel.description
        

//        let urlString = (characterModel.thumbnail?.path ?? "") + "." + (characterModel.thumbnail?.imageExtension ?? "")
//        profileImageView.image.downloadImageFrom(urlString: urlString, imageMode: .scaleAspectFill)

    }
    
}
