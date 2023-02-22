//
//  UserDataModel.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 21/02/23.
//

import Foundation

import Foundation
struct UserDataModel : Codable {
    let id : Int?
    let name : String?
    let username : String?
    let email : String?
    let address : UserDataAddress?
    let phone : String?
    let website : String?
    let company : UserDataCompany?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
        case address = "address"
        case phone = "phone"
        case website = "website"
        case company = "company"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        address = try values.decodeIfPresent(UserDataAddress.self, forKey: .address)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        company = try values.decodeIfPresent(UserDataCompany.self, forKey: .company)
    }

}

struct UserDataAddress : Codable {
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : UserDataGeo?

    enum CodingKeys: String, CodingKey {

        case street = "street"
        case suite = "suite"
        case city = "city"
        case zipcode = "zipcode"
        case geo = "geo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        suite = try values.decodeIfPresent(String.self, forKey: .suite)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
        geo = try values.decodeIfPresent(UserDataGeo.self, forKey: .geo)
    }

}

struct UserDataCompany : Codable {
    let name : String?
    let catchPhrase : String?
    let bs : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case catchPhrase = "catchPhrase"
        case bs = "bs"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
        bs = try values.decodeIfPresent(String.self, forKey: .bs)
    }

}

struct UserDataGeo : Codable {
    let lat : String?
    let lng : String?

    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lng = "lng"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(String.self, forKey: .lat)
        lng = try values.decodeIfPresent(String.self, forKey: .lng)
    }

}

