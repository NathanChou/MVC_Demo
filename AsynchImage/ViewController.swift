//
//  ViewController.swift
//  AsynchImage
//
//  Created by 周彥宏 on 2017/7/4.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    var tableData:[Model]!;
    var reachability = Reachability()!;
    var reachImageView:UIImageView!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reachabilityImageInit();
        
        reachability.whenReachable = { reachability in
            DispatchQueue.main.async {
                if reachability.isReachable{
                    print("Reachable internet");
                    self.reachImageView.isHidden = true;
                }
            }
        }
        
        reachability.whenUnreachable = { reachability in
            DispatchQueue.main.async {
                print("No reachable!");
                self.reachImageView.isHidden = false;
            }
        }
        do{
            try reachability.startNotifier();
        }catch{
            print("unble to start notifier");
        }

        
        myData.getJson { (json:[Model]) in
            DispatchQueue.main.async {
                self.tableData = json;
                self.tableView.reloadData();                
            }
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        reachImageView.fadeIn();
        reachImageView.fadeOut();
    }

    
    
    func reachabilityImageInit(){
        reachImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100));
        reachImageView.contentMode = .scaleAspectFit;
        reachImageView.center = self.tableView.center;
        reachImageView.image = UIImage(named: "nowifi");
        self.view.addSubview(reachImageView);
        reachImageView.isHidden = true;
        reachImageView.alpha = 0;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "123" {
            let new = segue.destination as! NewViewController;
            new.table = sender as! Model;
        }
    }


}


extension ViewController {
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData == nil {
            return 0;
        }
        
        return tableData.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! MyCell;
        
        
        
        let kind = tableData[indexPath.row].animal_kind;
        let sex = tableData[indexPath.row].animal_sex;
        let shelterName = tableData[indexPath.row].shelter_name;
        let imageStr = tableData[indexPath.row].album_file;
        
        
        cell.kindLabel.text = kind;
        cell.sexLabel.text = sex;
        cell.shelterNameLabel.text = shelterName;
        cell.myImageView.imageFromServerURL(urlString: imageStr);
        
        
        return cell;
    }
}


extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = tableData[indexPath.row];
        performSegue(withIdentifier: "123", sender: select);
    }
}

//NSCache
extension UIImageView {
    
    func fadeIn(withDuration duration:TimeInterval = 1){
        UIView.animate(withDuration: duration, delay: 0.5, options: [.repeat], animations: {
            self.alpha = 1.0;
        })
    }
    
    func fadeOut(withDuration duration:TimeInterval = 1){
        UIView.animate(withDuration: duration, delay: 1, options: [.repeat], animations: {
            self.alpha = 0.0;
        })
    }

    
       
    
    public func imageFromServerURL(urlString: String) {
        var imageCache = [String:UIImage]();
        
        if let image = imageCache[urlString] {
            self.image = image;
        }else{
            URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
                
                if error != nil {
                    print("download image error")
                    return
                }
                
                imageCache[urlString] = self.image
                
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    self.image = image
                })
                
            }).resume()
        }
        
        
        
        
    }

}





















