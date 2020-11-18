//
//  CardOwnerVerificationMethod.swift
//  PublicStruct
//
//  Created by Li, Ming on 2020/11/16.
//  Copyright © 2020 Visa Inc. All rights reserved.
//

import Foundation

public enum ContactType: String, Codable {
    case email = "EMAIL"
    case phone = "PHONE_NUMBER"
}

public struct CardOwnerVerificationMethod {
    public let contactID: String
    public let contactType: ContactType
    public let contactValue: String
}
