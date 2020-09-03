import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var imageCat:UIImageView!
    var imageDetail:Photo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCat.kf.setImage(with: URL(string: imageDetail.url))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.closeImage))
        imageCat.addGestureRecognizer(tap)
        imageCat.isUserInteractionEnabled = true
        
    }
    @objc func closeImage()
    {
        self.navigationController?.popViewController(animated: true)
    }
}
