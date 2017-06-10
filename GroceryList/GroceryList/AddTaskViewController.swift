

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var txtQuantity: UITextField!
    @IBOutlet weak var txtNote: UITextField!
    @IBOutlet weak var txtItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnSave(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        
        task.item = txtItem.text!
        task.note = txtNote.text!
        task.qty = txtQuantity.text!
        
        // save data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        dismissmain()
    }
    
    func dismissmain()
    {
        navigationController?.popViewController(animated: true)
    }
//    @IBAction func btnAddPressed(_ sender: Any) {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let task = Task(context: context)
//        
//        task.item = txtItem.text!
//        task.note = txtNote.text!
//        task.qty = txtQuantity.text
//        
//        // save data to coredata
//        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        
//        navigationController!.popViewController(animated: true)
//        
//        
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
