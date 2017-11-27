//
//  Model.swift
//  AsynchImage
//
//  Created by 周彥宏 on 2017/7/4.
//  Copyright © 2017年 周彥宏. All rights reserved.
//

import UIKit

class Model {
   
    var animal_place:String = ""; //所在地
    var animal_id:String = ""; //流水編號
    var animal_kind:String = ""; //類型
    var animal_sex:String = ""; //性別
    var animal_bodytype:String = ""; //體型
    var animal_colour:String = ""; //毛色
    var animal_age:String = ""; //年紀
    var animal_sterilization:String = ""; //是否絕育
    var animal_bacterin:String = ""; //是否施打疫苗
    var animal_remark:String = ""; //資料備註
    var animal_opendate:String = ""; //開放認養時間（起）
    var animal_update:String = ""; //動物資料異動時間
    var shelter_name:String = ""; //動物所屬收容所名稱
    var shelter_address:String = ""; //地址
    var shelter_tel:String = ""; //電話
    var album_file:String = ""; //圖片
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init(json:[String:Any]) throws {
        guard  let place = json["animal_place"] as? String else {throw SerializationError.missing("place is missing")};
        guard  let id = json["animal_id"] as? String else {throw SerializationError.missing("id is missing")};
        guard  let kind = json["animal_kind"] as? String else {throw SerializationError.missing("kind is missing")};
        guard  let sex = json["animal_sex"] as? String else {throw SerializationError.missing("sex is missing")};
        guard  let body = json["animal_bodytype"] as? String else {throw SerializationError.missing("bodytype is missing")};
        guard  let color = json["animal_colour"] as? String else {throw SerializationError.missing("color is missing")};
        guard  let age = json["animal_age"] as? String else {throw SerializationError.missing("age is missing")};
        guard  let sterilization = json["animal_sterilization"] as? String else {throw SerializationError.missing("sterilization is missing")};
        guard  let bacterin = json["animal_bacterin"] as? String else {throw SerializationError.missing("bacterin is missing")};
        guard  let remark = json["animal_remark"] as? String else {throw SerializationError.missing("remark is missing")};
        guard  let opendate = json["animal_opendate"] as? String else {throw SerializationError.missing("opendate is missing")};
        guard  let update = json["animal_update"] as? String else {throw SerializationError.missing("update is missing")};
        guard  let shelter_name = json["shelter_name"] as? String else {throw SerializationError.missing("shelter_name is missing")};
        guard  let shelter_address = json["shelter_address"] as? String else {throw SerializationError.missing("shelter_address is missing")};
        guard  let shelter_tel = json["shelter_tel"] as? String else {throw SerializationError.missing("shelter_tel is missing")};
        guard  let album_file = json["album_file"] as? String else {throw SerializationError.missing("album_file is missing")};
        
        self.animal_place = place;
        self.animal_id = id;
        self.animal_kind = kind;
        self.animal_sex = sex;
        self.animal_bodytype = body;
        self.animal_colour = color;
        self.animal_age = age;
        self.animal_sterilization = sterilization;
        self.animal_bacterin = bacterin;
        self.animal_remark = remark;
        self.animal_opendate = opendate;
        self.animal_update = update;
        self.shelter_name = shelter_name;
        self.shelter_address = shelter_address;
        self.shelter_tel = shelter_tel;
        self.album_file = album_file;
        
        
    }

}




















