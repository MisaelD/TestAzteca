import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
