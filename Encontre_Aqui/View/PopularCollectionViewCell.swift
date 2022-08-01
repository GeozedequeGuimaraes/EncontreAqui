import UIKit

class PopularCollectionViewCell: UICollectionViewCell{
    
    static let cellIdentifiaer = "popularCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func setup (title: String, image: UIImage) {
        titleLabel.text = title
        imageView.image = image
    }
}
