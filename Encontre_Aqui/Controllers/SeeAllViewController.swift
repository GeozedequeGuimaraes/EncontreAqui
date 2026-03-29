import UIKit

class SeeAllViewController: UIViewController {

    var movies: [Movie] = []
    var sectionTitle: String = ""

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 12, left: 16, bottom: 16, right: 16)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(red: 0.357, green: 0.533, blue: 0.906, alpha: 1.0)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(SeeAllCell.self, forCellWithReuseIdentifier: SeeAllCell.identifier)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = sectionTitle
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = UIColor(red: 0.357, green: 0.533, blue: 0.906, alpha: 1.0)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SeeAllViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeeAllCell.identifier, for: indexPath) as! SeeAllCell
        cell.configure(with: movies[indexPath.item])
        return cell
    }
}

extension SeeAllViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 44) / 2
        return CGSize(width: width, height: width * 1.7)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            detailsVC.movie = movie
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
