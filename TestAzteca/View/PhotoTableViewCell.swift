import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage : UIImageView!
    var delegate : CellActionsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImage)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func didTapImage() {
        delegate?.cameraPhoto(cell: self)
    }

}
