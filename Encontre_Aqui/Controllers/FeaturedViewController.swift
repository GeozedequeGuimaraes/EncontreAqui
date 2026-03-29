import UIKit

class FeaturedViewController: UIViewController {

    let popularMovies = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()

    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var seeAllPopularButton: UIButton!
    @IBOutlet var seeAllNowPlayingButton: UIButton!
    @IBOutlet var seeAllUpcomingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self

        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self

        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self

        seeAllPopularButton.addTarget(self, action: #selector(seeAllPopularTapped), for: .touchUpInside)
        seeAllNowPlayingButton.addTarget(self, action: #selector(seeAllNowPlayingTapped), for: .touchUpInside)
        seeAllUpcomingButton.addTarget(self, action: #selector(seeAllUpcomingTapped), for: .touchUpInside)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }

    @objc private func seeAllPopularTapped() {
        let vc = SeeAllViewController()
        vc.sectionTitle = "Popular"
        vc.movies = popularMovies
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func seeAllNowPlayingTapped() {
        let vc = SeeAllViewController()
        vc.sectionTitle = "Now Playing"
        vc.movies = nowPlayingMovies
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func seeAllUpcomingTapped() {
        let vc = SeeAllViewController()
        vc.sectionTitle = "Upcoming"
        vc.movies = upcomingMovies
        navigationController?.pushViewController(vc, animated: true)
    }

}
