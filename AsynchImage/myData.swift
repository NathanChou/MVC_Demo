//
//  Data.swift
//  AsynchImage
//
//  Created by 周彥宏 on 2017/7/4.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit

class myData {
    
    static let basePath = "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx";
    
    static func getJson (completion: @escaping ([Model]) -> ()) {
        
        let url = URL(string: basePath);
        let request = URLRequest(url: url!);
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var modelArray:[Model] = [];
            
            if error != nil {
                print("get data is fail");
            }
            
            if (response as? HTTPURLResponse)?.statusCode != 200 {
                let statusCode = (response as? HTTPURLResponse)?.statusCode;
                print("connected is fail \t statusCode is \(String(describing: statusCode))");
            }
            
            if let data = data {
                
                do{
                    if let jsons = try JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                        for json in jsons{
                            if let object = try? Model(json: json) {
                                modelArray.append(object);
                            }
                        }
                    }
                }catch{
                    print(error.localizedDescription);
                }
                
                completion(modelArray);
            }
        }
        task.resume();
        
    }
    
       
    
    

}
