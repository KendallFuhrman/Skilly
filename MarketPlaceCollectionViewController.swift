//
//  MarketPlaceCollectionViewController.swift
//  
//
//  Created by Kendall Fuhrman on 6/15/17.
//
//

import UIKit
import Alamofire
import FirebaseStorage
import Gloss




class MarketPlaceCollectionViewController: UICollectionViewController {
    

    var posts: [Post] = []
    
    override func viewDidAppear(_ animated: Bool) {
        posts = []
        Alamofire.request("https://skilly-3b5b9.firebaseio.com/post.json").responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
                for (key, value) in response {
                    let post = Post()
                    
                    if let postDictionary = value as? [String : AnyObject] {
                        post?.title = postDictionary["title"] as? String
                        post?.price = postDictionary ["price"] as? String
                        post?.description = postDictionary["description"] as? String
                        post?.type = postDictionary["type"] as? String
                        
                    }
                    
                    self.posts.append(post!)
                }
                self.collectionView?.reloadData()
            }
            // Loop through activities and download images
            for post in self.posts {
                
                let storageRef = Storage.storage().reference()
                
                //    let imagesRef = storageRef.child("images/\(profile.name!).jpg")
                //
                //    imagesRef.getData(maxSize: 10 * 1024 * 1024, completion: {(data, error) in
                //
                //                if let error = error {
                //                    // Uh-oh, an error occurred!
                //                    print(error.localizedDescription)
                //                } else {
                //                    // Data for "images/island.jpg" is returned
                //                    //    post.image = UIImage(data: data!)
                //                    self.collectionView?.reloadData()
                //                }
                
            }
            
            
            
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Register cell classes
            //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
            
            // Do any additional setup after loading the view.
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(posts.count)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCollectionViewCell
    
        if posts[indexPath.row].type == "s" {
            cell.backgroundColor = (UIColor(red: 136/255.0, green: 145/255.0, blue: 253/255.0, alpha: 1.0))
        } else {
            cell.backgroundColor = (UIColor(red: 102/255.0, green: 236/255.0, blue: 248/255.0, alpha: 1.0))
        }
        // Configure the cell
        
        cell.titleLabel?.text = posts[indexPath.row].title
        cell.priceLabel?.text = posts[indexPath.row].price
        cell.descriptionLabel?.text = posts[indexPath.row].description

//        if let image = activities[indexPath.row].image {
//            cell.imageView?.image = image
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
