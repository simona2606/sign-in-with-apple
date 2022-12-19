//
//  User.swift
//  SignInWithApple
//
//  Created by Simona Ettari on 14/12/22.
//

import Foundation
// HanabiDB
/*
 URL:
 https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User
 
 user: Admin
 password: harrypotter
 */

// JSON response
/*
 {
     "@odata.context": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/$metadata#User",
     "value": [
         {
             "@odata.id": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('645CBFE9-3AD2-46E3-B912-13C69B529A13')",
             "@odata.editLink": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('645CBFE9-3AD2-46E3-B912-13C69B529A13')",
             "Id": "645CBFE9-3AD2-46E3-B912-13C69B529A13",
             "CreationTimestamp": "2022-11-21T10:03:05Z",
             "CreatedBy": "Admin",
             "ModificationTimestamp": "2022-11-23T09:51:30Z",
             "ModifiedBy": "Admin",
             "firstName": "Antonio",
             "lastName": "Scognamiglio"
         },
         {
             "@odata.id": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('A11295B9-1BEB-4A7D-8961-F8909E869915')",
             "@odata.editLink": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('A11295B9-1BEB-4A7D-8961-F8909E869915')",
             "Id": "A11295B9-1BEB-4A7D-8961-F8909E869915",
             "CreationTimestamp": "2022-11-23T09:48:57Z",
             "CreatedBy": "Admin",
             "ModificationTimestamp": "2022-11-23T09:51:41Z",
             "ModifiedBy": "Admin",
             "firstName": "Alessia",
             "lastName": "Andrisani"
         },
         {
             "@odata.id": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('A2BABC37-22EF-4CFE-AABF-741AB7AF3EEB')",
             "@odata.editLink": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('A2BABC37-22EF-4CFE-AABF-741AB7AF3EEB')",
             "Id": "A2BABC37-22EF-4CFE-AABF-741AB7AF3EEB",
             "CreationTimestamp": "2022-11-23T15:28:08Z",
             "CreatedBy": "Admin",
             "ModificationTimestamp": "2022-11-23T15:28:14Z",
             "ModifiedBy": "Admin",
             "firstName": "Simona",
             "lastName": "Ettari"
         },
         {
             "@odata.id": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('6F50C662-52D7-4B78-84C4-39A98AD7C65D')",
             "@odata.editLink": "https://napoli.fm-testing.com/fmi/odata/v4/HanabiTestDB/User('6F50C662-52D7-4B78-84C4-39A98AD7C65D')",
             "Id": "6F50C662-52D7-4B78-84C4-39A98AD7C65D",
             "CreationTimestamp": "2022-11-23T15:28:14Z",
             "CreatedBy": "Admin",
             "ModificationTimestamp": "2022-11-23T15:28:20Z",
             "ModifiedBy": "Admin",
             "firstName": null,
             "lastName": null
         }
     ]
 }
*/


struct User: Codable, Identifiable {
    
    var id: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    
    public init() {
        self.id = ""
        self.email = ""
        self.firstName = ""
        self.lastName = ""
    }
    
    public init(id: String, email: String, firstName: String, lastName: String) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
    
}
