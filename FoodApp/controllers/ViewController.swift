//
//  ViewController.swift
//  FoodApp
//
//  Created by Mac on 7/3/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    
    @IBOutlet weak var CVfoodlist: UICollectionView!
    
    var listfood =  Array<Food>()
   // var listfood =  [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        ReadFromplist() ;
        
        
        
        CVfoodlist.reloadData()

        
    }
    
    
    //method of collection view
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listfood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellfood:FoodCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodCVC
        
        
        cellfood.nameFood.text =  listfood[indexPath.row].name!
        cellfood.imagefood.image = UIImage(named:listfood[indexPath.row].image!)

        
        return cellfood
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seguefood", sender: listfood[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if let distenation = segue.destination as? Detail{
            
            if let food = sender as? Food{
                
                distenation.food = food
            }
            
            
            
        }
    }
    
    
    // end of method
    
    
    func ReadFromplist(){
        
        
        let path  = Bundle.main.path(forResource: "Foods", ofType: "plist")!
        
        let url = URL(fileURLWithPath: path )
        
        let data = try! Data(contentsOf: url)
        
        
        
        
     // to can read the data (data be readable )
        
        
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers , format: nil)
        
        // casting(as!) .. convert data to as array of dictionary to deal with it
        
        let dictArray = plist as! [[String:String]]
        
        
        // for read this all data from array
        
        for item in dictArray{
            
            listfood.append(Food(img: item["img"]!, name: item["Name"]!, des: item["Des"]!))
            
            
        }
        
        
    }
    

}

