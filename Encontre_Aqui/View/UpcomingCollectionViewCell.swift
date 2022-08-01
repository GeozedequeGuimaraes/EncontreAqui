import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifiaer = "upcomingCell"
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    func setup (title: String, imageView: UIImage, data: String) {
        titleLabel.text = title
        image.image = imageView
        dataLabel.text = data
    }
}
