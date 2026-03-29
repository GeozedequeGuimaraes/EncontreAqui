import UIKit

class GenreCell: UICollectionViewCell {

    static let identifier = "GenreCell"

    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 13)
        label.textColor = UIColor(white: 1, alpha: 0.7)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.12)
        contentView.layer.cornerRadius = 14
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 1, green: 0.686, blue: 0.2, alpha: 0.6).cgColor

        contentView.addSubview(genreLabel)
        contentView.addSubview(countLabel)

        NSLayoutConstraint.activate([
            genreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            genreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            countLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 4),
            countLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(genre: String, count: Int) {
        genreLabel.text = genre
        countLabel.text = "\(count) filmes"
    }
}
