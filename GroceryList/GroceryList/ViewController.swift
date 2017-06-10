
import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableview: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        getdata()
        
        tableview.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        let task = tasks[indexPath.row]
        
         cell.textLabel?.text = "Item: \(task.item!)" + " Note: \(task.note!)" + " Qty: \(task.qty!)"
        return cell
    
        
        
        
}
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete
        {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
            tasks = try context.fetch(Task.fetchRequest())
            }
            catch
            {
                print ("failed")
            }
            tableview.reloadData()
        }
        
    }
    
    func getdata()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
        tasks = try context.fetch(Task.fetchRequest())
        }
        catch{
            print("failed")
        }
    }
    @IBAction func btnAdd(_ sender: Any) {
    }
    @IBAction func btnEdit(_ sender: Any) {
    }
    
    

}
