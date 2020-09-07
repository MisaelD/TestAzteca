import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var table : UITableView!
    
    var mainViewModel : MainViewModel?
    
    var itemsSelected = [DataMainCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel()
        
        dump(mainViewModel?.dataMainCellModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func siguiente() {
        if itemsSelected.count == 0 {
            showAlert()
        }else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ItemsActionsViewController") as! ItemsActionsViewController
            vc.itemsSelected = itemsSelected
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Elije alguna opción", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (mainViewModel?.dataMainCellModel?.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainViewCell
        cell.titleLabel.text = mainViewModel?.dataMainCellModel![indexPath.row].title
        cell.imageIcon.image = UIImage(named: (mainViewModel?.dataMainCellModel![indexPath.row].imageName)!)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                if let index = itemsSelected.index(where: { $0.title == mainViewModel?.dataMainCellModel![indexPath.row].title }) {
                    itemsSelected.remove(at: index)
                }
            } else {
                cell.accessoryType = .checkmark
                itemsSelected.append((mainViewModel?.dataMainCellModel![indexPath.row])!)
            }
        }
    }
}
