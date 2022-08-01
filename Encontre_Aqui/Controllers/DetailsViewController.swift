import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var genresLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backdropImage.layer.borderWidth = 1
        backdropImage.layer.borderColor = UIColor.white.cgColor
        backdropImage.layer.cornerRadius = 10.0
        posterImage.layer.borderWidth = 1
        posterImage.layer.borderColor = UIColor.white.cgColor
        posterImage.layer.cornerRadius = 8.0
        
        guard let movie = movie else {
            return
        }
        self.title = movie.title
        self.backdropImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
        
    }
    
}
