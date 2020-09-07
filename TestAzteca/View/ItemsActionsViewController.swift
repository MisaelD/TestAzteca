import UIKit

class ItemsActionsViewController: UIViewController, CellActionsDelegate {
    
    @IBOutlet weak var table : UITableView!
    
    var itemsActionViewModel : ItemsActionsViewModel?
    var itemsSelected : [DataMainCellModel]?
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsActionViewModel = ItemsActionsViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var cellPhoto : PhotoTableViewCell?
    var cellPicker : DatePickerTableViewCell?
    
    func cameraPhoto(cell: PhotoTableViewCell) {
        
        cellPhoto = cell
        
        let vc = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            vc.sourceType = .camera
        }else {
            vc.sourceType = .photoLibrary
        }
        
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
        
    }
    
    func datePicker(cell: DatePickerTableViewCell) {
        
        cellPicker = cell
        
        
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Hecho", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        cellPicker?.birthTextField.inputAccessoryView = toolbar
        
        cellPicker?.birthTextField.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        cellPicker?.birthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    

    
}

extension ItemsActionsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (itemsSelected?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch itemsSelected?[indexPath.row].imageName {
        case "camera"?:
            return 275
        case "photo"?:
            return 275
        case "name"?:
            return 50
        case "phone"?:
            return 50
        case "birth"?:
            return 50
        default:
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch itemsSelected?[indexPath.row].imageName {
        case "camera"?:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoTableViewCell
            cell.delegate = self
            return cell
        case "photo"?:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
            itemsActionViewModel?.loadImage(targetImage: cell.imageFromURL)
            return cell
        case "name"?:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! DatePickerTableViewCell
            cell.delegate = self
            return cell
        case "phone"?:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as! DatePickerTableViewCell
            cell.delegate = self
            return cell
        case "birth"?:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BirthCell", for: indexPath) as! DatePickerTableViewCell
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! DatePickerTableViewCell
            cell.delegate = self
            return cell
        }
        
        
        
    }
}

extension ItemsActionsViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        cellPhoto?.photoImage.image = image
        
        print(image.size)
    }
    
}
