import UIKit

class GenresViewController: UIViewController {

    private let allMovies: [Movie] = {
        var movies = Movie.popularMovies()
        movies.append(contentsOf: Movie.nowPlayingMovies())
        movies.append(contentsOf: Movie.upcomingMovies())
        movies.append(contentsOf: Movie.trendingThisWeekMovies())
        movies.append(contentsOf: Movie.trendingTodayMovies())
        // Remove duplicates by title
        var seen = Set<String>()
        return movies.filter { seen.insert($0.title).inserted }
    }()

    private lazy var genres: [String] = {
        var genreSet = Set<String>()
        for movie in allMovies {
            for genre in movie.genres {
                genreSet.insert(genre)
            }
        }
        return genreSet.sorted()
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 0.357, green: 0.533, blue: 0.906, alpha: 1.0)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Generos"
        view.backgroundColor = UIColor(red: 0.357, green: 0.533, blue: 0.906, alpha: 1.0)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func movies(for genre: String) -> [Movie] {
        allMovies.filter { $0.genres.contains(genre) }
    }
}

extension GenresViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath) as! GenreCell
        let genre = genres[indexPath.item]
        let count = movies(for: genre).count
        cell.configure(genre: genre, count: count)
        return cell
    }
}

extension GenresViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 44) / 2
        return CGSize(width: width, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let genre = genres[indexPath.item]
        let vc = SeeAllViewController()
        vc.sectionTitle = genre
        vc.movies = movies(for: genre)
        navigationController?.pushViewController(vc, animated: true)
    }
}
