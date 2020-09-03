import UIKit
import Alamofire
import Kingfisher

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    var images : [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        
        loadPhotos()
    }
    
    private func loadPhotos(){
        NetworkingManager.getPhotosUrl { (result: Result<[Photo]>) in
            switch result {
            case .success(let photos):
                self.images = photos
                self.collectionView.reloadData()
            case .failure:
                print("Error")
            }
        }
    }
}

extension CollectionViewController : UICollectionViewDataSource {
    func collectionView (_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell
        cell.configure(image: images[indexPath.row])
        return cell
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        let height = collectionView.bounds.width / 2
        return CGSize(width: width, height : height)
    }
    // El espaciado de los items con la collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    //El espaciado de un item con relacion a otro, en fila
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //El espaciado de un item con relacion a otro, en columna
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.imageDetail = images[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
        collectionView.reloadData()
    }
}

