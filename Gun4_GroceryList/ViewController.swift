//
//  ViewController.swift
//  Gun4_GroceryList
//
//  Created by OMER on 15.11.2015.
//  Copyright (c) 2015 OMER. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var nItem: List? = nil
    
    
    @IBOutlet weak var entryQty: UITextField!
    @IBOutlet weak var entryNote: UITextField!
    @IBOutlet weak var entryItem: UITextField!
    
    @IBAction func saveTapped(sender: AnyObject) {
        if nItem != nil{
            editItem()
        } else {
            newItem()
        }
        
        dismissVC()
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    func newItem(){
        let context = self.context
        let ent = NSEntityDescription.entityForName("List", inManagedObjectContext: context!)
        let nItem = List(entity: ent!, insertIntoManagedObjectContext: context)
        
        nItem.item = entryItem.text
        nItem.note = entryNote.text
        nItem.qty = entryQty.text
        
        context?.save(nil)
        
        
    }
    
    func editItem(){
        nItem?.item = entryItem.text
        nItem?.note=entryNote.text
        nItem?.qty=entryQty.text
        
        context?.save(nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        if nItem != nil{
            entryItem.text = nItem?.item
            entryNote.text = nItem?.note
            entryQty.text = nItem?.qty
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

