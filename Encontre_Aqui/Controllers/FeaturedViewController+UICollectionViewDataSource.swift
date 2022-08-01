import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        }
        else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        }
        else if collectionView == self.upcomingCollectionView {
            return nowPlayingMovies.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView{
            return makePopularCell(indexPath)
        }
        else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        else if collectionView == self.upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifiaer, for: indexPath) as? PopularCollectionViewCell
        cell?.setup(title: popularMovies[indexPath.item].title, image: UIImage(named: popularMovies[indexPath.item].backdrop) ?? UIImage())
        cell?.imageView.layer.cornerRadius = 8.0
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowplayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowplayingCollectionViewCell.cellIdentifiaer, for: indexPath) as? NowplayingCollectionViewCell
        let year: String = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
        
        cell?.setup(title: nowPlayingMovies[indexPath.item].title, imageView: UIImage(named: nowPlayingMovies[indexPath.item].poster) ?? UIImage(), data: year)
        
        cell?.image.layer.cornerRadius = 4.0
        
        return cell ?? NowplayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifiaer, for: indexPath) as? UpcomingCollectionViewCell
        let year: String = String(upcomingMovies[indexPath.item].releaseDate.prefix(4))
         
        cell?.setup(title: upcomingMovies[indexPath.item].title, imageView: UIImage(named: upcomingMovies[indexPath.item].poster) ?? UIImage(), data: year)
        
        cell?.image.layer.cornerRadius = 12.0
        
        return cell ?? UpcomingCollectionViewCell()
    }

}
