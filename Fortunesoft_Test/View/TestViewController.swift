
//
import UIKit
import Kingfisher

class TestViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var NewData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getData()
        let layout = UICollectionViewFlowLayout()
               layout.minimumInteritemSpacing = 10
               layout.minimumLineSpacing = 10
               let itemWidth = ((UIScreen.main.bounds.width-30) / 2)
               layout.itemSize = CGSize(width: itemWidth, height: itemWidth-30)
               collectionView.collectionViewLayout = layout
    }
    
 func getData()
    {
        APIManager.sharedInstance.getData().done
        {
            response in
            do{
                print("my actual response is:",response.data)
                self.NewData = response.data
                self.collectionView.reloadData()
                
            }
        }.ensure {
            
        }.catch
        {_ in
            
        }
    }
}

extension TestViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NewData.count
    }
            
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.title.text = NewData[indexPath.row].title
        let url = URL(string: NewData[indexPath.row].image)!
        cell.image.kf.setImage(with: url)
        cell.image.layer.cornerRadius = 5.0
        cell.image.layer.masksToBounds = true
        return cell
    }
 }

class CollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
      
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
