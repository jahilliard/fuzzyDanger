//
//  Room.swift
//  barr
//
//  Created by Justin Hilliard on 2/10/16.
//  Copyright © 2016 barrapp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Circle {
    let locationId : String?;
    var members : [String: UserInfo];
    
    init(dictionary: NSDictionary) {
        self.locationId = dictionary["businessId"] as? String;
        let members = dictionary["members"] as? [NSDictionary];
        
        self.members = [String: UserInfo]();
        if (members != nil){
            for dictionary in members!{
                let dicJSON = JSON(dictionary)
                let singleMember = UserInfo(userInfo: dicJSON["userInfo"]);
                self.members[singleMember.userId] = singleMember;
            }
        }
    }
    
    func addMember(dictionary: NSDictionary) {
        let dicJSON = JSON(dictionary)
        let singleMember = UserInfo(userInfo: dicJSON["userInfo"]);
        self.members[singleMember.userId] = singleMember;
    }
    
    func deleteMember(userId: String){
        self.members.removeValueForKey(userId);
    }
}