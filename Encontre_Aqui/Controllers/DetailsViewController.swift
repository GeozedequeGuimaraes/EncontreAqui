import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        backdropImage.layer.borderWidth = 1
        backdropImage.layer.borderColor = UIColor.white.cgColor
        backdropImage.layer.cornerRadius = 10.0
        backdropImage.clipsToBounds = true
        posterImage.layer.borderWidth = 1
        posterImage.layer.borderColor = UIColor.white.cgColor
        posterImage.layer.cornerRadius = 8.0
        posterImage.clipsToBounds = true

        guard let movie = movie else { return }

        self.title = movie.title
        backdropImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.poster)
        overviewLabel.text = movie.overview

        ratingLabel.numberOfLines = 0
        ratingLabel.lineBreakMode = .byWordWrapping

        let rating = String(format: "%.1f", movie.voteAverage)
        let year = String(movie.releaseDate.prefix(4))
        let genres = movie.genres.joined(separator: ", ")
        ratingLabel.text = "\(rating)/10\n\(year)\n\(genres)"
    }
}
